Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C294B708B3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Oct 2014 09:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s969WwHY024559; Mon, 6 Oct 2014 10:32:58 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Ypqs_i7My8qF; Mon,  6 Oct 2014 10:32:57 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s969WpsI024556
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 6 Oct 2014 10:32:53 +0100
Message-ID: <1412588005.2301.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Konrad Scherer <konrad.scherer@windriver.com>
Date: Mon, 06 Oct 2014 10:33:25 +0100
In-Reply-To: <1412277290-11352-1-git-send-email-konrad.scherer@windriver.com>
References: <1412277290-11352-1-git-send-email-konrad.scherer@windriver.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Makedoc.sh uses home /tmp and fails is noexec is set
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
X-List-Received-Date: Mon, 06 Oct 2014 09:33:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-10-02 at 15:14 -0400, Konrad Scherer wrote:
> From: Konrad Scherer <Konrad.Scherer@windriver.com>
> 
> The Makedoc.sh script uses the following line to set TMPDIR
> 
> export TMPDIR=`mktemp -d ${TMPDIR:-/tmp}/ldt.XXXXXXXXXX`;
> 
> and then later in the script:
> 
> chmod u+x $TMPDIR/linuxdoc
> 
> Since TMPDIR is not set the script will default to /tmp and if /tmp
> is set to noexec (which is becoming more common), the chmod call fails.
> 
> Signed-off-by: Konrad Scherer <Konrad.Scherer@windriver.com>
> ---
>  meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
> index ed6ab73..9bd2bba 100644
> --- a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
> +++ b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
> @@ -19,3 +19,7 @@ inherit autotools-brokensep native
>  do_configure () {
>  	oe_runconf
>  }
> +
> +do_install() {
> +	oe_runmake TMPDIR=${T} install
> +}

This actually breaks the builds pretty badly. The fact the image
directory is empty after the above change is a bad sign. The reason is
that it needs to be:

oe_runmake "TMPDIR=${T}" "DESTDIR=${D}" install

If you don't specify DESTDIR, the files in the sysroot disappear and you
get strange errors from recipes like libuser. 

Cheers,

Richard



