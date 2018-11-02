Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2AD6679F3F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 06:44:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wA26iJnB006515
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Nov 2018 23:44:19 -0700 (PDT)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Thu, 1 Nov 2018 23:44:18 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1541138944-68335-1-git-send-email-changqing.li@windriver.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <cee0a299-65a4-e7e5-a434-002df47263cc@windriver.com>
Date: Fri, 2 Nov 2018 14:44:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1541138944-68335-1-git-send-email-changqing.li@windriver.com>
X-Originating-IP: [128.224.162.228]
Subject: Re: [PATCH] xserver-xorg: fix for CVE-2018-14665
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
X-List-Received-Date: Fri, 02 Nov 2018 06:44:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Please ignore this patch, I just noticed it is fixed in master.

On 11/2/18 2:09 PM, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   .../xorg-xserver/xserver-xorg/CVE-2018-14665.patch | 56 ++++++++++++++++++++++
>   1 file changed, 56 insertions(+)
>   create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2018-14665.patch
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2018-14665.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2018-14665.patch
> new file mode 100644
> index 0000000..5dd6fe0
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2018-14665.patch
> @@ -0,0 +1,56 @@
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/
> +commit/50c0cf885a6e91c0ea71fb49fa8f1b7c86fe330e]
> +
> +CVE: CVE-2018-14665
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +
> +From 50c0cf885a6e91c0ea71fb49fa8f1b7c86fe330e Mon Sep 17 00:00:00 2001
> +From: Matthieu Herrb <matthieu@herrb.eu>
> +Date: Tue, 23 Oct 2018 21:29:08 +0200
> +Subject: [PATCH] Disable -logfile and -modulepath when running with elevated
> + privileges
> +
> +Could cause privilege elevation and/or arbitrary files overwrite, when
> +the X server is running with elevated privileges (ie when Xorg is
> +installed with the setuid bit set and started by a non-root user).
> +
> +CVE-2018-14665
> +
> +Issue reported by Narendra Shinde and Red Hat.
> +
> +Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
> +Reviewed-by: Alan Coopersmith <alan.coopersmith@oracle.com>
> +Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
> +Reviewed-by: Adam Jackson <ajax@redhat.com>
> +---
> + hw/xfree86/common/xf86Init.c | 8 ++++++--
> + 1 file changed, 6 insertions(+), 2 deletions(-)
> +
> +diff --git a/hw/xfree86/common/xf86Init.c b/hw/xfree86/common/xf86Init.c
> +index 6c25eda73..0f57efa86 100644
> +--- a/hw/xfree86/common/xf86Init.c
> ++++ b/hw/xfree86/common/xf86Init.c
> +@@ -935,14 +935,18 @@ ddxProcessArgument(int argc, char **argv, int i)
> +     /* First the options that are not allowed with elevated privileges */
> +     if (!strcmp(argv[i], "-modulepath")) {
> +         CHECK_FOR_REQUIRED_ARGUMENT();
> +-        xf86CheckPrivs(argv[i], argv[i + 1]);
> ++        if (xf86PrivsElevated())
> ++              FatalError("\nInvalid argument -modulepath "
> ++                "with elevated privileges\n");
> +         xf86ModulePath = argv[i + 1];
> +         xf86ModPathFrom = X_CMDLINE;
> +         return 2;
> +     }
> +     if (!strcmp(argv[i], "-logfile")) {
> +         CHECK_FOR_REQUIRED_ARGUMENT();
> +-        xf86CheckPrivs(argv[i], argv[i + 1]);
> ++        if (xf86PrivsElevated())
> ++              FatalError("\nInvalid argument -logfile "
> ++                "with elevated privileges\n");
> +         xf86LogFile = argv[i + 1];
> +         xf86LogFileFrom = X_CMDLINE;
> +         return 2;
> +--
> +2.18.1

-- 
BRs

Sandy(Li Changqing)


