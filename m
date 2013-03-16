Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UGz4P-0007bP-LG
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Mar 2013 22:55:22 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Mar 2013 14:36:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,857,1355126400"; d="scan'208";a="280524561"
Received: from unknown (HELO [10.255.12.246]) ([10.255.12.246])
	by orsmga001.jf.intel.com with ESMTP; 16 Mar 2013 14:38:30 -0700
Message-ID: <5144E656.7050808@linux.intel.com>
Date: Sat, 16 Mar 2013 14:38:30 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: eu@felipetonello.com
References: <1363193354-6895-1-git-send-email-eu@felipetonello.com>
	<1363193354-6895-4-git-send-email-eu@felipetonello.com>
In-Reply-To: <1363193354-6895-4-git-send-email-eu@felipetonello.com>
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 3/3] qt-mobility: added list of modules to be compiled
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
X-List-Received-Date: Sat, 16 Mar 2013 21:55:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/13/2013 09:49 AM, eu@felipetonello.com wrote:
> From: "Felipe F. Tonello" <ftonello@cercacor.com>
>
> This is useful for users that want to .bbappend this recipe to select specific
> modules to be compiled.
>
> Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
> ---
>   meta/recipes-qt/qt4/qt-mobility_1.2.0.inc |    6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> index fca4cb0..849235c 100644
> --- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> +++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> @@ -18,7 +18,7 @@ SRC_URI = "http://get.qt.nokia.com/qt/add-ons/qt-mobility-opensource-src-${PV}.t
>   SRC_URI[md5sum]="ea5db5a8d3dd4709c2926dceda646bd8"
>   SRC_URI[sha256sum]="ee3c88975e04139ac9589f76d4be646d44fcbc4c8c1cf2db621abc154cf0ba44"
>
> -PR = "r7"
> +PR = "r8"
>
>   S = "${WORKDIR}/qt-mobility-opensource-src-${PV}"
>
> @@ -31,6 +31,8 @@ qtm_plugins	:= "/usr/lib/${qtm_dir}/plugins/QtMobility"
>   qtm_data	:= "/usr/share/${qtm_dir}"
>   qtm_imports	:= "/usr/lib/${qtm_dir}/imports"
>
> +qtm_modules_list ?= "bearer contacts gallery location publishsubscribe messaging multimedia \
> +systeminfo serviceframework sensors versit organizer feedback connectivity"
>   qtm_bluezflag ?= "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'yes', 'no', d)}"
>
>   do_configure_prepend() {
> @@ -44,7 +46,7 @@ do_configure_prepend() {
>   	cp staticconfig.pri staticconfig.pri.old
>   	echo "include(${STAGING_DATADIR}/${qtm_dir}/mkspecs/qconfig.pri)" >staticconfig.pri
>   	cat staticconfig.pri.old >>staticconfig.pri
> -	./configure -qmake-exec qmake2 -prefix /usr -examples -demos
> +	./configure -qmake-exec qmake2 -prefix /usr -examples -demos -modules ${qtm_modules_list}
This change seems to generate an error from the configure scripts

> | Unknown option: contacts
> | Usage: configure [-prefix <dir>] [headerdir <dir>] [libdir <dir>]
> |                  [-bindir <dir>] [-tests] [-examples] [-no-docs]
> |                  [-no-tools] [-debug] [-release] [-silent]
> |                  [-modules <list>]


I think you need to add quotes to the around the list based on this from 
the help:

> | -modules <list> ... Restrict list of modules to build (default all supported)
> |                     Choose from: bearer contacts gallery location publishsubscribe
> |                     messaging multimedia systeminfo serviceframework
> |                     sensors versit organizer feedback connectivity
> |                     Modules should be separated by a space and surrounded
> |                     by double quotation. If a selected module depends on other modules
> |                     those modules (and their dependencies) will automatically be enabled.


Thanks
	Sau!

>   	echo QT_MOBILITY_BIN = ${qtm_bin} >>./config.pri
>   	echo QT_MOBILITY_LIB = ${qtm_lib} >>./config.pri
>   	echo QT_MOBILITY_INCLUDE = ${qtm_include} >>./config.pri
>


