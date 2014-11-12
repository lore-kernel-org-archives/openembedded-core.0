Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 99E4F65C7B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 01:03:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAC13g2w004554
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 17:03:42 -0800 (PST)
Received: from [128.224.163.178] (128.224.163.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 11 Nov 2014 17:03:41 -0800
Message-ID: <5462B1EC.3050009@windriver.com>
Date: Wed, 12 Nov 2014 09:03:40 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1415753976-2033-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1415753976-2033-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH] rpm: fix the rpm addsign function
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
X-List-Received-Date: Wed, 12 Nov 2014 01:03:44 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

sorry, Please drop it.

I will resend it.

-Roy

On 2014年11月12日 08:59, rongqing.li@windriver.com wrote:
> From: "Roy.Li" <rongqing.li@windriver.com>
>
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>   ...arseArgvString-to-parse-the-_gpg_check_pa.patch | 49 ++++++++++++++++++++++
>   meta/recipes-devtools/rpm/rpm_5.4.14.bb            |  1 +
>   2 files changed, 50 insertions(+)
>   create mode 100644 meta/recipes-devtools/rpm/rpm/0001-using-poptParseArgvString-to-parse-the-_gpg_check_pa.patch
>
> diff --git a/meta/recipes-devtools/rpm/rpm/0001-using-poptParseArgvString-to-parse-the-_gpg_check_pa.patch b/meta/recipes-devtools/rpm/rpm/0001-using-poptParseArgvString-to-parse-the-_gpg_check_pa.patch
> new file mode 100644
> index 0000000..23bc336
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/rpm/0001-using-poptParseArgvString-to-parse-the-_gpg_check_pa.patch
> @@ -0,0 +1,49 @@
> +From 64851c6622aff64787a9fcea26cccde183b7c743 Mon Sep 17 00:00:00 2001
> +From: "Roy.Li" <rongqing.li@windriver.com>
> +Date: Tue, 11 Nov 2014 16:28:22 +0800
> +Subject: [PATCH] using poptParseArgvString to parse the
> + _gpg_check_password_cmd
> +
> +Upstream-Status: Pending
> +
> +Both __gpg_check_password_cmd and __gpg_sign_cmd include "%{_gpg_name}", but
> +strace shows that gpg_name has a quote when run _gpg_check_password,
> +but not when run __gpg_sign_cmd; for example, if gpg_name is "tester"
> +
> +    execve("/usr/bin/gpg", ["gpg", "--batch", "--no-verbose",
> +    "--passphrase-fd", "3", "-u", "\"tester\"", "-so", "-"], [/* 20 vars */]) = 0
> +
> +    execve("/usr/bin/gpg", ["gpg", "--batch", "--no-verbose", "--no-armor",
> +    "--passphrase-fd", "3", "--no-secmem-warning", "-u", "tester", "-sbo"..,) = 0
> +
> +it can be fixed by removing the quote around %{gpg_name} when define
> +__gpg_check_password_cmd in macros/macros, like below, but if gpg_name includes
> +space, it will not work.
> +
> +     %__gpg_check_password_cmd       %{__gpg} \
> +        gpg --batch --no-verbose --passphrase-fd 3 -u %{_gpg_name} -so -
> +
> +The poptParseArgvString function is used to parse _gpg_sign_cmd, so using
> +poptParseArgvString to parse __gpg_check_password_cmd to fix this issue.
> +
> +Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> +---
> + rpmdb/signature.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/rpmdb/signature.c b/rpmdb/signature.c
> +index c35e0ab..016e8d1 100644
> +--- a/rpmdb/signature.c
> ++++ b/rpmdb/signature.c
> +@@ -529,7 +529,7 @@ int rpmCheckPassPhrase(const char * passPhrase)
> +   		(void) setenv("GNUPGHOME", gpg_path, 1);
> +
> + 	    cmd = rpmExpand("%{?__gpg_check_password_cmd}", NULL);
> +-	    rc = argvSplit(&av, cmd, NULL);
> ++	    rc = poptParseArgvString(cmd, NULL, (const char ***)&av);
> + 	    if (!rc)
> + 		rc = execve(av[0], (char *const *)av+1, environ);
> +
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
> index fb8a507..c882251 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
> @@ -93,6 +93,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.14-0.20131024.src.rpm;e
>   	   file://rpm-db5-or-db6.patch \
>   	   file://rpm-disable-Wno-override-init.patch \
>   	   file://rpmqv_cc_b_gone.patch \
> +	   file://0001-using-poptParseArgvString-to-parse-the-_gpg_check_pa.patch \
>   	  "
>
>   # Uncomment the following line to enable platform score debugging
>

-- 
Best Reagrds,
Roy | RongQing Li

