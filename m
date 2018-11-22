Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8BF3C6C570
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 12:15:25 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wAMCFO6s018071
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 22 Nov 2018 12:15:25 GMT
Message-ID: <6a604c2114548416e44a6502839aca37e677b3ef.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2018 12:15:24 +0000
In-Reply-To: <e1fef41e951d281c3d0f2eb99abbb6a13afff8de.1542887170.git.liezhi.yang@windriver.com>
References: <cover.1542887170.git.liezhi.yang@windriver.com>
	<e1fef41e951d281c3d0f2eb99abbb6a13afff8de.1542887170.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/2] nopackages.bbclass: improve performance for cleansstate
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Nov 2018 12:15:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-11-22 at 19:51 +0800, Robert Yang wrote:
> Leave the task in SSTATETASKS doesn't make sense when it is removed,
> so also
> remove it from SSTATETASKS.
> 
> This can improve the performance a lot for "bitbake <recipe-
> native/cross/crosssdk>
> -ccleansstate" when there are a lot of sstate files.
> 
> For example:
> * Before
>   $ bitbake quilt-native -ccleansstate
>   - Check log.do_cleansstate:
>   Removing /sstate-cache/*/*/sstate:quilt-native:x86_64-
> linux:0.65:r0:x86_64:3:*_package.tgz*
>   Removing /sstate-cache/*/*/sstate:quilt-native:x86_64-
> linux:0.65:r0:x86_64:3:*_package_qa.tgz*
>   Removing /sstate-cache/*/*/sstate:quilt-native:x86_64-
> linux:0.65:r0:x86_64:3:*_package_write_rpm.tgz*
>   Removing /sstate-cache/*/*/sstate:quilt-native:x86_64-
> linux:0.65:r0:x86_64:3:*_packagedata.tgz*
>   Removing /sstate-cache/*/sstate:quilt-
> native::0.65:r0::3:*_populate_lic.tgz*
>   Removing /sstate-cache/*/*/sstate:quilt-native:x86_64-
> linux:0.65:r0:x86_64:3:*_populate_sysroot.tgz*
> 
>   There are no package tasks for quilt-native, so the first 4 lines
> doesn't
>   make any sense, but the glob pattern "sstate-cache/*/*" is very
> time
>   consuming when there are no disk caches. E.g., I have more than
> 600,000
>   sstate files:
>   - Without disk caches
>   # echo 3 >/proc/sys/vm/drop_caches
>   $ time python3 -c 'import glob; glob.glob("/sstate-
> cache/*/*/sstate:quilt-native:x86_64-
> linux:0.65:r0:x86_64:3:*_package.tgz*")'
>     real    4m32.583s
>     user    0m5.768s
>     sys     0m12.892s
> 
>   - With disk caches (e.g., run it in the second time)
>   $ time python3 -c 'import glob; glob.glob("/sstate-
> cache/*/*/sstate:quilt-native:x86_64-
> linux:0.65:r0:x86_64:3:*_package.tgz*")'
>     real    0m5.128s
>     user    0m2.772s
>     sys     0m2.308s
> 
>   So the 4 removing *package* commands cost more than 20s or 272s in
> theory.
> 
> * After
>   $ bitbake quilt-native -ccleansstate
>   - Check log.do_cleansstate:
>   Removing /sstate-cache/*/sstate:quilt-
> native::0.65:r0::3:*_populate_lic.tgz*
>   Removing /sstate-cache/*/*/sstate:quilt-native:x86_64-
> linux:0.65:r0:x86_64:3:*_populate_sysroot.tgz*
> 
>   Now the package tasks are gone when cleanssate for native recipes,
> which
>   saved 20s or 272s in theory.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/nopackages.bbclass | 35 +++++++++++++++++++++++------
> ------
>  1 file changed, 23 insertions(+), 12 deletions(-)
> 
> diff --git a/meta/classes/nopackages.bbclass
> b/meta/classes/nopackages.bbclass
> index 559f507..66e4936 100644
> --- a/meta/classes/nopackages.bbclass
> +++ b/meta/classes/nopackages.bbclass
> @@ -1,12 +1,23 @@
> -deltask do_package
> -deltask do_package_write_rpm
> -deltask do_package_write_ipk
> -deltask do_package_write_deb
> -deltask do_package_qa
> -deltask do_packagedata
> -deltask do_package_setscene
> -deltask do_package_write_rpm_setscene
> -deltask do_package_write_ipk_setscene
> -deltask do_package_write_deb_setscene
> -deltask do_package_qa_setscene
> -deltask do_packagedata_setscene
> +NO_PACKAGES_TASKS = " \
> +    do_package \
> +    do_package_write_rpm \
> +    do_package_write_ipk \
> +    do_package_write_deb \
> +    do_package_qa \
> +    do_packagedata \
> +"
> +
> +python() {
> +    sstatetasks = (d.getVar('SSTATETASKS') or '').split()
> +    for task in d.getVar('NO_PACKAGES_TASKS').split():
> +        setscene_task = '%s_setscene' % task
> +        tasks = (task, setscene_task)
> +        for t in tasks:
> +            bb.build.deltask(t, d)
> +
> +        if task in sstatetasks:
> +            bb.debug(2, 'Removing sstate task %s from SSTATETASKS' %
> task)
> +            sstatetasks.remove(task)
> +    d.setVar('SSTATETASKS', ' '.join(sstatetasks))
> +
> +}

I really don't want to turn more comparatively readable classes into a
mess of anonymous python if we can help it.

Can we not just teach cleansstate to check if a task exists before
trying to delete the sstate? It should be possible with
d.getVarFlag(taskname, "task")?

Cheers,

Richard


