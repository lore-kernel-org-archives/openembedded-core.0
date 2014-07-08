Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AE0EE65CA8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jul 2014 10:03:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s68A3Ygr016071
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 Jul 2014 03:03:34 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 8 Jul 2014 03:03:34 -0700
Message-ID: <53BBC1EE.5060608@windriver.com>
Date: Tue, 8 Jul 2014 18:03:26 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1404812342.git.hongxu.jia@windriver.com>
	<b0e0464a72f2f2fa6b96a0f1d175c8b0d2b41ebb.1404812342.git.hongxu.jia@windriver.com>
In-Reply-To: <b0e0464a72f2f2fa6b96a0f1d175c8b0d2b41ebb.1404812342.git.hongxu.jia@windriver.com>
Cc: saul.wold@intel.com
Subject: Re: [PATCH 3/8] docbook-xml: add docbook-xml-dtd4
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
X-List-Received-Date: Tue, 08 Jul 2014 10:03:38 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/08/2014 05:47 PM, Hongxu Jia wrote:

> diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
> new file mode 100644
> index 0000000..3b20391
> --- /dev/null
> +++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
> @@ -0,0 +1,75 @@
> +# The DTDs of the various versions have to be installed in parallel and
> +# should not replace each other. The installation step is common for
> +# all versions and just differs in ${DTD_VERSION} which is set in each
> +# version recipe.
> +#
> +# The DTDs do have some quirks (see LFS documentation).
> +SUMMARY = "Document type definitions for verification of XML data files"
> +DESCRIPTION = "Document type definitions for verification of XML data \
> +files against the DocBook rule set, it ships with the latest DocBook 4.5 \
> +XML DTD, as well as a selected set of legacy DTDs for use with older \
> +documents, including 4.0, 4.1.2, 4.2, 4.3 and 4.4"
> +HOMEPAGE = "http://www.docbook.org/xml/"
> +
> +LICENSE = "OASIS"
> +LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE-OASIS;md5=c608985dd5f7f215e669e7639a0b1d2e"
> +
> +# Note: the upstream sources are not distributed with a license file.
> +# LICENSE-OASIS is included as a "patch" to workaround this. When
> +# upgrading this recipe, please verify whether this is still needed.
> +SRC_URI = "${DEBIAN_MIRROR}/main/d/docbook-xml/docbook-xml_${PV}.orig.tar.gz \
> +           file://LICENSE-OASIS \
> +           file://docbook-xml-update-catalog.xml.patch \
> +           file://docbook-xml.xml \
> +"
> +
> +SRC_URI[md5sum] = "487b4d44e15cffb1f4048af23f98208e"
> +SRC_URI[sha256sum] = "b0f8edcf697f5318e63dd98c9a931f3fee167af0805ba441db372e0f17b2a44f"
> +
> +S="${WORKDIR}/docbook-xml-4.5.c31424"
> +
> +inherit allarch
> +BBCLASSEXTEND = "native"
> +
> +SSTATEPOSTINSTFUNCS_append_class-native = " docbook_xml_dtd_sstate_postinst"
> +SYSROOT_PREPROCESS_FUNCS_append_class-native = " docbook_xml_dtd_sysroot_preprocess"
> +
> +do_configre (){
> +  :
> +}
> +
> +do_compile (){
> +  :
> +}
> +
> +do_install () {
> +    # Refer debian https://packages.debian.org/sid/all/docbook-xml/filelist
> +    for DTDVERSION in 4.0 4.1.2 4.2 4.3 4.4 4.5; do
> +        install -d -m 755 ${D}${datadir}/xml/docbook/schema/dtd/${DTDVERSION}
> +        cp -v -R docbook-${DTDVERSION}/* ${D}${datadir}/xml/docbook/schema/dtd/${DTDVERSION}
> +    done
> +
> +    install -d ${D}${sysconfdir}/xml/
> +    install -m 755  ${WORKDIR}/docbook-xml.xml ${D}${sysconfdir}/xml/docbook-xml.xml
> +}
> +
> +do_install_append_class-nativesdk () {
> +    # Update the hardcode dir in docbook-xml.xml
> +    sed -i -e "s|file:///usr/share/xml|file://${datadir}/xml|g" ${D}${sysconfdir}/xml/docbook-xml.xml
> +}

Remove the nativesdk do_install_append_class-nativesd, we don't support 
nativesdk.

I update the git tree directly, no v2 will be sent.

//Hongxu

> +
> +docbook_xml_dtd_sstate_postinst () {
> +    if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
> +    then
> +        # Ensure that the catalog file sgml-docbook.cat is properly
> +        # updated when the package is installed from sstate cache.
> +        sed -i -e "s|file://.*/usr/share/xml|file://${datadir}/xml|g" ${SYSROOT_DESTDIR}${sysconfdir}/xml/docbook-xml.xml
> +    fi
> +}
> +
> +docbook_xml_dtd_sysroot_preprocess () {
> +    # Update the hardcode dir in docbook-xml.xml
> +    sed -i -e "s|file:///usr/share/xml|file://${datadir}/xml|g" ${SYSROOT_DESTDIR}${sysconfdir}/xml/docbook-xml.xml
> +}
> +
> +FILES_${PN} = "${datadir}/* ${sysconfdir}/xml/docbook-xml.xml"


