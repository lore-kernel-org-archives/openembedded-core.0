Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8EC6D73E36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 16:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5NG2f1r002528; Tue, 23 Jun 2015 17:02:41 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id wLveCaqaX2IO; Tue, 23 Jun 2015 17:02:41 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5NG2Rf2002514
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 23 Jun 2015 17:02:38 +0100
Message-ID: <1435075347.11489.87.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 23 Jun 2015 17:02:27 +0100
In-Reply-To: <1435072967-10333-1-git-send-email-sgw@linux.intel.com>
References: <1435072967-10333-1-git-send-email-sgw@linux.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] tune-i586-nlp: Add new tune file to support Quark/X1000 CPU
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
X-List-Received-Date: Tue, 23 Jun 2015 16:02:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-06-23 at 08:22 -0700, Saul Wold wrote:
> This tune file is needed to enable a GAS option specific to this cpu family
> in order to disable the usage of lock prefix instructions.
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/conf/machine/include/tune-i586-nlp.inc | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta/conf/machine/include/tune-i586-nlp.inc
> 
> diff --git a/meta/conf/machine/include/tune-i586-nlp.inc b/meta/conf/machine/include/tune-i586-nlp.inc
> new file mode 100644
> index 0000000..6815a16
> --- /dev/null
> +++ b/meta/conf/machine/include/tune-i586-nlp.inc
> @@ -0,0 +1,20 @@
> +#
> +# Settings for the GAS(1) cpu-type quark/x1000 which has issues
> +# with lock-prefix so use that option to omit them.
> +#
> +
> +DEFAULTTUNE ?= "i586-nlp"
> +
> +# Include the previous tune to pull in PACKAGE_EXTRA_ARCHS
> +require conf/machine/include/tune-i586.inc
> +
> +# x86 with no lock prefix
> +TUNEVALID[nlp] = "IA32 with Lock Prefix omitted"
> +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "nlp", " -Wa,-momit-lock-prefix=yes", "", d)}"
> +
> +# Quark tune feature 
> +AVAILTUNES = "i586-nlp"
> +TUNE_FEATURES_tune-i586-nlp = "${TUNE_FEATURES_tune-i586} nlp"
> +TUNE_PKGARCH_tune-i586-nlp = "i586-nlp"
> +PACKAGE_EXTRA_ARCHS_tune-i586-nlp = "${PACKAGE_EXTRA_ARCHS_tune-i586} i586-nlp"

Since i586 doesn't work with this hardware, should this inherit the i586
tune?

Cheers,

Richard




