Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5C49777811
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 21:04:58 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Aug 2017 14:05:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,417,1498546800"; d="scan'208";a="141309496"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by orsmga005.jf.intel.com with ESMTP; 23 Aug 2017 14:04:59 -0700
Message-ID: <1503522842.2166.9.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Wed, 23 Aug 2017 16:14:02 -0500
In-Reply-To: <88b6e8e6744cb5fa6712d91b6746a314e850dfa6.1503507784.git.alexander.kanavin@linux.intel.com>
References: <cover.1503507784.git.alexander.kanavin@linux.intel.com>
	<88b6e8e6744cb5fa6712d91b6746a314e850dfa6.1503507784.git.alexander.kanavin@linux.intel.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/7] json-glib: convert to meson build
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
X-List-Received-Date: Wed, 23 Aug 2017 21:04:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


> -inherit gnomebase gettext lib_package gobject-introspection gtk-doc manpages
> +inherit gnomebase-meson lib_package gobject-introspection gtk-doc manpages

gettext is dropped, does it mean that it was not needed?

>  
> -PACKAGECONFIG[manpages] = "--enable-man --with-xml-catalog=${STAGING_ETCDIR_NATIVE}/xml/catalog.xml, --disable-man, libxslt-native xmlto-native"
> +GTKDOC_ENABLE_FLAG = "-Denable-gtk-doc=true"
> +GTKDOC_DISABLE_FLAG = "-Denable-gtk-doc=false"
> +
> +GI_ENABLE_FLAG = "-Ddisable_introspection=false"
> +GI_DISABLE_FLAG = "-Ddisable_introspection=true"
> +
> +EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GTKDOC_ENABLED', 'True', '${GTKDOC_ENABLE_FLAG}', \
> +                                                                                    '${GTKDOC_DISABLE_FLAG}', d)} "
> +EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '${GI_ENABLE_FLAG}', \
> +                                                                                    '${GI_DISABLE_FLAG}', d)} "
> +
> +PACKAGECONFIG[manpages] = "-Denable-man=true, -Denable-man=false, libxslt-native xmlto-native"
> +
> +do_install_append() {
> +    # FIXME: these need to be provided via ptest
> +    rm -rf ${D}${datadir}/installed-tests ${D}${libexecdir}
> +}
>  
>  BBCLASSEXTEND = "native nativesdk"
> -- 
> 2.14.1
> 



