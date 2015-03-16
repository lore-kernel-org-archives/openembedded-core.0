Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D46B26013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 06:16:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2G6GPnK013682
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 15 Mar 2015 23:16:25 -0700 (PDT)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 15 Mar 2015 23:16:25 -0700
Message-ID: <55067537.1060108@windriver.com>
Date: Mon, 16 Mar 2015 14:16:23 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, <openembedded-core@lists.openembedded.org>
References: <1426485217-18563-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1426485217-18563-1-git-send-email-sgw@linux.intel.com>
Subject: Re: [PATCH] openssl: fix libssl.pc to Require libcrypto
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
X-List-Received-Date: Mon, 16 Mar 2015 06:16:40 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


I'm afraid that it doesn't work, the error is the same as before
for openflow.

// Robert

On 03/16/2015 01:53 PM, Saul Wold wrote:
> The 1.0.2 version of libssl requires that libcrypto be linked so don't
> keep it private anymore.
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   .../openssl/openssl/fix_Makefile_creation_of_libssl.patch   | 13 +++++++++++++
>   meta/recipes-connectivity/openssl/openssl_1.0.2.bb          |  1 +
>   2 files changed, 14 insertions(+)
>   create mode 100644 meta/recipes-connectivity/openssl/openssl/fix_Makefile_creation_of_libssl.patch
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/fix_Makefile_creation_of_libssl.patch b/meta/recipes-connectivity/openssl/openssl/fix_Makefile_creation_of_libssl.patch
> new file mode 100644
> index 0000000..dbf1f3c
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/fix_Makefile_creation_of_libssl.patch
> @@ -0,0 +1,13 @@
> +Index: openssl-1.0.2/Makefile
> +===================================================================
> +--- openssl-1.0.2.orig/Makefile
> ++++ openssl-1.0.2/Makefile
> +@@ -381,7 +381,7 @@ libssl.pc: Makefile
> + 	    echo 'Name: OpenSSL-libssl'; \
> + 	    echo 'Description: Secure Sockets Layer and cryptography libraries'; \
> + 	    echo 'Version: '$(VERSION); \
> +-	    echo 'Requires.private: libcrypto'; \
> ++	    echo 'Requires: libcrypto'; \
> + 	    echo 'Libs: -L$${libdir} -lssl'; \
> + 	    echo 'Libs.private: $(EX_LIBS)'; \
> + 	    echo 'Cflags: -I$${includedir} $(KRB5_INCLUDES)' ) > libssl.pc
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2.bb
> index 79537f9..a980855 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2.bb
> @@ -37,6 +37,7 @@ SRC_URI += "file://configure-targets.patch \
>               file://Makefiles-ptest.patch \
>               file://ptest-deps.patch \
>               file://run-ptest \
> +            file://fix_Makefile_creation_of_libssl.patch \
>              "
>
>   SRC_URI[md5sum] = "38373013fc85c790aabf8837969c5eba"
>

