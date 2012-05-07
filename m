Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SRN2H-0001ji-H5 for openembedded-core@lists.openembedded.org;
	Mon, 07 May 2012 14:27:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q47CHd7s003596
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 May 2012 13:17:39 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01674-08 for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2012 13:17:35 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q47CHSbL003586
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 May 2012 13:17:30 +0100
Message-ID: <1336393053.20211.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 07 May 2012 13:17:33 +0100
In-Reply-To: <1336389953-19123-1-git-send-email-andrei@gherzan.ro>
References: <1336389953-19123-1-git-send-email-andrei@gherzan.ro>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] fotowall: Add patch which adds ui_wizard.h as a make dependency to ExportWizard.o
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
X-List-Received-Date: Mon, 07 May 2012 12:27:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-05-07 at 14:25 +0300, Andrei Gherzan wrote:
> App/ExportWizard.cpp depends on wizard.h which depends on ui_wizard. The last one
> should be already generated before compiling ExportWizard.cpp.
> 
> [YOCTO #2297]
> 
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> ---
>  meta/recipes-qt/qt-apps/fotowall_0.9.bb            |    6 ++++--
>  .../ExportWizard-depends-on-ui_wizard.patch        |   20 ++++++++++++++++++++
>  2 files changed, 24 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-qt/qt-apps/fotowall_0.9/ExportWizard-depends-on-ui_wizard.patch
> 
> diff --git a/meta/recipes-qt/qt-apps/fotowall_0.9.bb b/meta/recipes-qt/qt-apps/fotowall_0.9.bb
> index 52dd727..04580ff 100644
> --- a/meta/recipes-qt/qt-apps/fotowall_0.9.bb
> +++ b/meta/recipes-qt/qt-apps/fotowall_0.9.bb
> @@ -7,12 +7,14 @@ LIC_FILES_CHKSUM = "file://GPL_V2;md5=79808397c3355f163c012616125c9e26 \
>                      file://main.cpp;beginline=6;endline=11;md5=b569acc2bf8974a3082b58fc53b9d8dc"
>  SECTION = "x11/apps"
>  
> -PR = "r2"
> +PR = "r3"
>  
>  DEPENDS = "qt4-x11-free"
>  RRECOMMENDS_${PN} += "qt4-plugin-imageformat-gif qt4-plugin-imageformat-jpeg qt4-plugin-imageformat-tiff"
>  
> -SRC_URI = "http://qt-apps.org/CONTENT/content-files/71316-Fotowall-0.9.tar.bz2"
> +SRC_URI = "http://qt-apps.org/CONTENT/content-files/71316-Fotowall-0.9.tar.bz2 \
> +	   file://ExportWizard-depends-on-ui_wizard.patch \
> +	   "
>  
>  SRC_URI[md5sum] = "142ef697332e0777c6d22c5bc96cc438"
>  SRC_URI[sha256sum] = "e4d0c005d2cb1d7c09438bfc3098eadebc08946e4fbc0655b7fc8b046de3810d"
> diff --git a/meta/recipes-qt/qt-apps/fotowall_0.9/ExportWizard-depends-on-ui_wizard.patch b/meta/recipes-qt/qt-apps/fotowall_0.9/ExportWizard-depends-on-ui_wizard.patch
> new file mode 100644
> index 0000000..4101e28
> --- /dev/null
> +++ b/meta/recipes-qt/qt-apps/fotowall_0.9/ExportWizard-depends-on-ui_wizard.patch
> @@ -0,0 +1,20 @@
> +App/ExportWizard.cpp depends on wizard.h which depends on ui_wizard. The last one
> +should be already generated before compiling ExportWizard.cpp.
> +
> +Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> +Upstream-Status: Pending
> +
> +Index: Fotowall-0.9/Makefile
> +===================================================================
> +--- Fotowall-0.9.orig/Makefile	2012-05-06 16:54:26.991254818 +0300
> ++++ Fotowall-0.9/Makefile	2012-05-06 16:52:57.000000000 +0300
> +@@ -1074,7 +1074,8 @@
> + 		Canvas/CanvasModeInfo.h \
> + 		App/App.h \
> + 		App/Settings.h \
> +-		.build/ui_ExportWizard.h
> ++		.build/ui_ExportWizard.h \
> ++		.build/ui_wizard.h
> + 	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o .build/ExportWizard.o App/ExportWizard.cpp
> + 
> + .build/FotowallFile.o: App/FotowallFile.cpp App/FotowallFile.h \


Isn't this Makefile autogenerated?

Cheers,

Richard




