Received: from mail-bk0-f50.google.com ([209.85.214.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1UExyC-0002KM-FX
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 09:20:34 +0100
Received: by mail-bk0-f50.google.com with SMTP id jg9so1504480bkc.23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 01:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:date:message-id:in-reply-to:references
	:user-agent:subject:mime-version:content-type
	:content-transfer-encoding;
	bh=tHOKyCh2l9yTlmlPzmLMfaPG7HyLoAteCk3Km3BssFA=;
	b=vmTLcwU+eMFWsCr5bv/FszLpKAMeJPAdToZWAmQ458x2mIdfY6AuDfQW6UUC6MADxo
	c6TtfRE6L1YzSyyKWwkUCbdHsyYurov2vfWqDpOlPUvX+CffMqqHuXvitc/8UlHN3vA8
	xTYtazkFllYaZ7jFl1T3iV7vE4aYmg8G68aJ/xQnHq7sZA6x+eblmQceHvW/T+++7+FF
	+opcbEkcW2zY3yR/kta98WCKi2EjDbHnZ/x0d2lpSHaJhxoukZdZL6TWo341QTiAPGCG
	XTsaEs6vZL4qNZHO8kGRSfFwdWPrt8nNkgcdBlkXweqPjmJQMdBOXbG+y+zl41tb/KoT
	DIBA==
X-Received: by 10.204.186.1 with SMTP id cq1mr4058926bkb.73.1362989034853;
	Mon, 11 Mar 2013 01:03:54 -0700 (PDT)
Received: from [176.66.89.136] (176066089136.atmpu0051.highway.a1.net.
	[176.66.89.136])
	by mx.google.com with ESMTPS id x10sm3646350bkv.13.2013.03.11.01.03.53
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 01:03:54 -0700 (PDT)
From: "Bernhard Reutner-Fischer" <rep.dot.nop@gmail.com>
To: Kang Kai <kai.kang@windriver.com>, <richard.purdie@linuxfoundation.org>
Date: Mon, 11 Mar 2013 09:06:24 +0100
Message-ID: <13d587c67be.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
In-Reply-To: <1eab6578b55eee05f36c14d1e536c793c5d80659.1362966448.git.kai.kang@windriver.com>
References: <cover.1362966448.git.kai.kang@windriver.com>
	<1eab6578b55eee05f36c14d1e536c793c5d80659.1362966448.git.kai.kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1 AquaMail/1.2.2.20 (build:
	2100226)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] insane.bbclass: make do_package_qa be a task
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Mar 2013 08:20:36 -0000
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Transfer-Encoding: 8bit

On 11 March 2013 04:31:17 Kang Kai <kai.kang@windriver.com> wrote:
> do_package_qa is added to variable PACKAGEFUNCS and run after
> do_package. packaging tests should not ending up in package.bbclass.
> Split do_package_qa as a new task after do_package.
>
> [YOCTO #3190]
>
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
>  meta/classes/insane.bbclass |   15 +++++++++++++--
>  1 files changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index bd6f120..d7787ac 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -17,9 +17,9 @@
>  #   files under exec_prefix
>
>
> -inherit package
> +#inherit package
>  PACKAGE_DEPENDS += "${QADEPENDS}"
> -PACKAGEFUNCS += " do_package_qa "
> +#PACKAGEFUNCS += " do_package_qa "

I'd remove those lines, they are in the history anyway.

>
>  # unsafe-references-in-binaries requires prelink-rtld from
>  # prelink-native, but we don't want this DEPENDS for -native builds
> @@ -654,6 +654,15 @@ def package_qa_walk(path, warnfuncs, errorfuncs, 
> skip, package, d):
>      target_os   = d.getVar('TARGET_OS', True)
>      target_arch = d.getVar('TARGET_ARCH', True)
>
> +    pkgfiles = {}
> +    packages = d.getVar('PACKAGES', True).split()
> +    pkgdest = d.getVar('PKGDEST', True)
> +    for pkg in packages:
> +        pkgfiles[pkg] = []
> +        for walkroot, dirs, files in os.walk(pkgdest + "/" + pkg):

I'd use os.sep above, too.
I would ACK the patch with these changes, fwiw.
Thanks,
> +            for file in files:
> +                pkgfiles[pkg].append(walkroot + os.sep + file)
> +
>      warnings = []
>      errors = []
>      for path in pkgfiles[package]:
> @@ -823,6 +832,8 @@ python do_package_qa () {
>      bb.note("DONE with PACKAGE QA")
>  }
>
> +addtask package_qa after do_package before do_build
> +EXPORT_FUNCTIONS do_package_qa
>
>  python do_qa_staging() {
>      bb.note("QA checking staging")
> --
> 1.7.5.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


Sent with AquaMail for Android
http://www.aqua-mail.com




