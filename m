Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Pun4J-00018I-JQ
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 15:30:24 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p22EStDt011765
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Mar 2011 06:28:55 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 2 Mar 2011 06:28:54 -0800
Message-ID: <4D6E5425.5080107@windriver.com>
Date: Wed, 2 Mar 2011 08:28:53 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1299055045-8096-1-git-send-email-raj.khem@gmail.com>
	<1299055045-8096-2-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1299055045-8096-2-git-send-email-raj.khem@gmail.com>
X-Originating-IP: [172.25.36.227]
Subject: Re: [PATCH v2 1/7] sqlite3: Update version 3.7.3 -> 3.7.5
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Mar 2011 14:30:24 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 3/2/11 2:37 AM, Khem Raj wrote:
> * Imported from OE commit a2c3af2d608b1b713018d688b00e03873a538993
> * native version of 3.7.3 does not build
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-support/sqlite/sqlite3.inc      |    7 ++++++-
>  meta/recipes-support/sqlite/sqlite3_3.7.3.bb |    8 --------
>  meta/recipes-support/sqlite/sqlite3_3.7.5.bb |   10 ++++++++++
>  3 files changed, 16 insertions(+), 9 deletions(-)
>  delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.3.bb
>  create mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.5.bb
> 
> diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
> index 92c4930..a5e6782 100644
> --- a/meta/recipes-support/sqlite/sqlite3.inc
> +++ b/meta/recipes-support/sqlite/sqlite3.inc
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://www.sqlite.org"
>  SECTION = "libs"
>  PRIORITY = "optional"
>  DEPENDS = "readline ncurses tcl-native"
> -DEPENDS_virtclass-native = "tcl-native"
> +DEPENDS_virtclass-native = "tcl-native ncurses-native"
>  LICENSE = "PD"

Sorry, I didn't notice this before either.  Is ncurses-native and tcl-native
actually needed here?

From what I understand of sqlite, the ncurses is only used when readline is
used.  Readline during a virtclass-native build is disabled in the sqlite3.inc
file.  (Similarly tcl is also disabled in the sqlite3.inc file.)


>  SRC_URI = "http://www.sqlite.org/sqlite-${PV}.tar.gz \
> @@ -32,3 +32,8 @@ FILES_lib${PN}-doc = "${docdir} ${mandir} ${infodir}"
>  AUTO_LIBNAME_PKGS = "lib${PN}"
>  
>  BBCLASSEXTEND = "native nativesdk"
> +
> +#do_compile_prepend() {
> +#        oe_runmake sqlite3.h
> +#        install -m 0644 sqlite3.h ${STAGING_INCDIR}
> +#}

Any reason to keep this, or can we just remove the code?

> diff --git a/meta/recipes-support/sqlite/sqlite3_3.7.3.bb b/meta/recipes-support/sqlite/sqlite3_3.7.3.bb
> deleted file mode 100644
> index 7296aba..0000000
> --- a/meta/recipes-support/sqlite/sqlite3_3.7.3.bb
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -require sqlite3.inc
> -
> -LIC_FILES_CHKSUM = "file://src/main.c;endline=16;md5=86c9b824e9d68f8a26343a4b57f6d85a"
> -
> -PR = "r1"
> -
> -SRC_URI[md5sum] = "5437978aae90350cf984993091e0d695"
> -SRC_URI[sha256sum] = "dbf352e8fbb74829f5e7a88f9f6ceeb80a709537f668c36e4b6cdfb271309ef6"
> diff --git a/meta/recipes-support/sqlite/sqlite3_3.7.5.bb b/meta/recipes-support/sqlite/sqlite3_3.7.5.bb
> new file mode 100644
> index 0000000..212d9e2
> --- /dev/null
> +++ b/meta/recipes-support/sqlite/sqlite3_3.7.5.bb
> @@ -0,0 +1,10 @@
> +require sqlite3.inc
> +
> +LIC_FILES_CHKSUM = "file://sqlite3.c;endline=19;md5=c1b8048b783961c3ba387c43fd955dc6"
> +
> +SRC_URI = "http://www.sqlite.org/sqlite-autoconf-3070500.tar.gz"
> +S = "${WORKDIR}/sqlite-autoconf-3070500"
> +PR = "r0"
> +
> +SRC_URI[md5sum] = "a9604a82613ade2e7f4c303f233e477f"                                                 
> +SRC_URI[sha256sum] = "cb5b86926ec9f65882b2dddd244f2d620337d911ec73411863f77e48cf6a2f94"              



