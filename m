Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id A4C6E60616
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 16:35:49 +0000 (UTC)
Received: (qmail 28751 invoked by uid 1003); 24 May 2016 16:35:50 -0000
Received: from unknown (HELO ?192.168.11.140?)
	(philip@opensdr.com@108.44.118.32)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	24 May 2016 16:35:49 -0000
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
	<70f76410663868b8cd737d28456ce2b7a5ddea27.1464088997.git.alexander.kanavin@linux.intel.com>
From: Philip Balister <philip@balister.org>
Message-ID: <c1841b58-1c28-7a1d-9316-d8fd4cf1f4af@balister.org>
Date: Tue, 24 May 2016 12:35:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.0
MIME-Version: 1.0
In-Reply-To: <70f76410663868b8cd737d28456ce2b7a5ddea27.1464088997.git.alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH 05/45] sip.bbclass: remove
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
X-List-Received-Date: Tue, 24 May 2016 16:35:50 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

The pyqt recipe in meta-qt4 uses sip.

Philip

On 05/24/2016 07:53 AM, Alexander Kanavin wrote:
> Nothing is requiring it in oe-core or meta-oe.
> 
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/classes/sip.bbclass | 61 ------------------------------------------------
>  1 file changed, 61 deletions(-)
>  delete mode 100644 meta/classes/sip.bbclass
> 
> diff --git a/meta/classes/sip.bbclass b/meta/classes/sip.bbclass
> deleted file mode 100644
> index 6ed2a13..0000000
> --- a/meta/classes/sip.bbclass
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -# Build Class for Sip based Python Bindings
> -# (C) Michael 'Mickey' Lauer <mickey@Vanille.de>
> -#
> -STAGING_SIPDIR ?= "${STAGING_DATADIR_NATIVE}/sip"
> -
> -DEPENDS  =+ "sip-native"
> -RDEPENDS_${PN} += "python-sip"
> -
> -# default stuff, do not uncomment
> -# EXTRA_SIPTAGS = "-tWS_X11 -tQt_4_3_0"
> -
> -# do_generate is before do_configure so ensure that sip_native is populated in sysroot before executing it
> -do_generate[depends] += "sip-native:do_populate_sysroot"
> -
> -sip_do_generate() {
> -	if [ -z "${SIP_MODULES}" ]; then 
> -		MODULES="`ls sip/*mod.sip`"
> -	else
> -		MODULES="${SIP_MODULES}"
> -	fi
> -
> -	if [ -z "$MODULES" ]; then
> -		die "SIP_MODULES not set and no modules found in $PWD"
> -        else
> -		bbnote "using modules '${SIP_MODULES}' and tags '${EXTRA_SIPTAGS}'"
> -	fi
> -
> -	if [ -z "${EXTRA_SIPTAGS}" ]; then
> -		die "EXTRA_SIPTAGS needs to be set!"
> -	else
> -		SIPTAGS="${EXTRA_SIPTAGS}"
> -	fi
> -
> -	if [ ! -z "${SIP_FEATURES}" ]; then
> -		FEATURES="-z ${SIP_FEATURES}"
> -		bbnote "sip feature file: ${SIP_FEATURES}"
> -	fi
> -
> -	for module in $MODULES
> -	do
> -		install -d ${module}/
> -		echo "calling 'sip4 -I sip -I ${STAGING_SIPDIR} ${SIPTAGS} ${FEATURES} -c ${module} -b ${module}/${module}.pro.in sip/${module}/${module}mod.sip'"
> -		sip4 -I ${STAGING_SIPDIR} -I sip ${SIPTAGS} ${FEATURES} -c ${module} -b ${module}/${module}.sbf \
> -			sip/${module}/${module}mod.sip || die "Error calling sip on ${module}"
> -		sed -e 's,target,TARGET,' -e 's,sources,SOURCES,' -e 's,headers,HEADERS,' \
> -			${module}/${module}.sbf | sed s,"moc_HEADERS =","HEADERS +=", \
> -			>${module}/${module}.pro
> -		echo "TEMPLATE=lib" >>${module}/${module}.pro
> -		[ "${module}" = "qt" ] 		&& echo "" 		>>${module}/${module}.pro
> -		[ "${module}" = "qtcanvas" ] 	&& echo ""		>>${module}/${module}.pro
> -		[ "${module}" = "qttable" ] 	&& echo ""		>>${module}/${module}.pro
> -		[ "${module}" = "qwt" ] 	&& echo ""		>>${module}/${module}.pro
> -		[ "${module}" = "qtpe" ]        && echo ""		>>${module}/${module}.pro
> -		[ "${module}" = "qtpe" ]        && echo "LIBS+=-lqpe"	>>${module}/${module}.pro
> -		true
> -	done
> -}
> -
> -EXPORT_FUNCTIONS do_generate
> -
> -addtask generate after do_unpack do_patch before do_configure
> 

