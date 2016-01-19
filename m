Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D611065CC3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 09:41:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0J9f5lP015556
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 01:41:05 -0800 (PST)
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 19 Jan 2016 01:41:04 -0800
To: <openembedded-core@lists.openembedded.org>
References: <cover.1453196137.git.liezhi.yang@windriver.com>
	<bb110858045d626bc56fb43920ae9acda71d038c.1453196137.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <569E04AF.5090402@windriver.com>
Date: Tue, 19 Jan 2016 17:41:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <bb110858045d626bc56fb43920ae9acda71d038c.1453196137.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 1/1] insane.bbclass:buildpaths: ignore ipkg/dpkg's CONTROL dir
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
X-List-Received-Date: Tue, 19 Jan 2016 09:41:06 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Update the subjected line a little in the repo:

insane.bbclass:buildpaths: ignore ipkg/dpkg's CONTROL dir

   git://git.openembedded.org/openembedded-core-contrib rbt/ipk
   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/ipk

Robert Yang (1):
   insane.bbclass:buildpaths: ignore ipkg/dpkg's CONTROL dir

* Changes, added ":buildpaths" which is more accurate.

// Robert

On 01/19/2016 05:36 PM, Robert Yang wrote:
> Fixed race issue when:
> WARN_QA_append = " buildpaths"
> PACKAGE_CLASSES = "package_ipk"
> $ bitbake e2fsprogs
>
> [snip]
>   *** 0595:    with open(path) as f:
>       0596:        file_content = f.read()
>       0597:        if tmpdir in file_content:
>       0598:            messages["buildpaths"] = "File %s in package contained reference to tmpdir" % package_qa_clean_path(path,d)
>       0599:
> Exception: IOError: [Errno 2] No such file or directory: '/path/to/tmp/work/core2-64-poky-linux/e2fsprogs/1.42.9-r0/packages-split/e2fsprogs-ptest/CONTROL/control'
>
> The similar to package_deb.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/classes/insane.bbclass |    4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index ba9c651..c16e6ad 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -584,6 +584,10 @@ def package_qa_check_buildpaths(path, name, d, elf, messages):
>       if os.path.islink(path):
>           return
>
> +    # Ignore ipk and deb's CONTROL dir
> +    if path.find(name + "/CONTROL/") != -1 or path.find(name + "/DEBIAN/") != -1:
> +        return
> +
>       tmpdir = d.getVar('TMPDIR', True)
>       with open(path) as f:
>           file_content = f.read()
>

