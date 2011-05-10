Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QJiaf-0005yN-JU for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 10:46:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4A8i5Bv025016;
	Tue, 10 May 2011 09:44:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24959-01; Tue, 10 May 2011 09:44:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4A8htu8025010
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 10 May 2011 09:43:56 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <118af5382d7c13327de95c46e4976ed7863ba3d0.1305004776.git.sgw@linux.intel.com>
References: <cover.1305004776.git.sgw@linux.intel.com>
	<118af5382d7c13327de95c46e4976ed7863ba3d0.1305004776.git.sgw@linux.intel.com>
Date: Tue, 10 May 2011 09:43:51 +0100
Message-ID: <1305017031.30391.247.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 26/30] qmake_base.bbclass: add generate_qt_config_file task
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
X-List-Received-Date: Tue, 10 May 2011 08:46:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-05-09 at 22:26 -0700, Saul Wold wrote:
> From: Otavio Salvador <otavio@ossystems.com.br>
> 
> This writes a qt.conf inside WORKDIR to properly configure projects
> based on CMake. This is required since qmake variables (returned
> by -query command) are fixed into the binary and can only be
> changed using a qt.conf file.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/classes/qmake_base.bbclass |   15 +++++++++++++++
>  1 files changed, 15 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/classes/qmake_base.bbclass b/meta/classes/qmake_base.bbclass
> index 24a0f11..37c44c7 100644
> --- a/meta/classes/qmake_base.bbclass
> +++ b/meta/classes/qmake_base.bbclass
> @@ -31,6 +31,21 @@ oe_qmake_mkspecs () {
>      done
>  }
>  
> +do_generate_qt_config_file() {
> +	export QT_CONF_PATH=${WORKDIR}/qt.conf
> +	bbwarn "${WORKDIR}/qt.conf"
> +	cat > ${WORKDIR}/qt.conf <<EOF
> +[Paths]
> +Prefix = ${STAGING_DIR}
> +Binaries = ${BUILD_SYS}${bindir_native}
> +Headers = ${MACHINE}${prefix}/include/qt4
> +Plugins = ${MACHINE}${prefix}/lib/qt4/plugins/
> +Mkspecs = ${MACHINE}${prefix}/share/qt4/mkspecs/

Can we simplify this to use STAGING_BINDIR_NATIVE, STAGING_INCDIR,
STAGING_LIBDIR and STAGING_DATADIR?

Cheers,

Richard



