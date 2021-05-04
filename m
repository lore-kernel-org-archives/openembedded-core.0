Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.4337.1620128023830364384
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 May 2021 04:33:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: bst@pengutronix.de)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <bst@pengutronix.de>)
	id 1ldtJ8-0007JI-9E; Tue, 04 May 2021 13:33:42 +0200
Subject: Re: [OE-core] [PATCH] ccache: add packageconfig docs option
To: Konrad Weihmann <kweihmann@outlook.com>,
 openembedded-core@lists.openembedded.org
References: <20210504112050.32393-1-bst@pengutronix.de>
 <AM9PR09MB4642814415A3D958307A8C2AA85A9@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: "Bastian Krause" <bst@pengutronix.de>
Message-ID: <23b25ae6-e93c-9232-bad7-4c096cf1593a@pengutronix.de>
Date: Tue, 4 May 2021 13:33:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <AM9PR09MB4642814415A3D958307A8C2AA85A9@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: bst@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 5/4/21 1:24 PM, Konrad Weihmann wrote:
> 
> 
> On 04.05.21 13:20, Bastian Krause wrote:
>> Before, ccache's configure stage built HTML documentation and man pages
>> depending on if asciidoc is installed. This patch makes it configurable.
>>
>> Pass the new cmake option BUILD_DOCS along and add the asciidoc
>> dependency if necessary.
>>
>> This fixes an issue when ccache's configure stage found asciidoc/a2x on
>> the system outside of the sysroot (e.g. installed via 'apt install
>> asciidoc'). ccache would then decide to build docs and manual pages, but
>> would fail during compilation: the system's a2x could not find the
>> system's asciidoc because it did not reside in the set PATH.
>>
>> By enabling/disabling docs/man page generation explicitly and adding
>> asciidoc to DEPENDS as necessary, this is no longer an issue.
>>
>> Signed-off-by: Bastian Krause <bst@pengutronix.de>
>> ---
>>   ...w-disabling-docs-man-page-generation.patch | 161 ++++++++++++++++++
>>   meta/recipes-devtools/ccache/ccache_4.2.1.bb  |   6 +-
>>   2 files changed, 166 insertions(+), 1 deletion(-)
>>   create mode 100644
>> meta/recipes-devtools/ccache/ccache/0001-doc-allow-disabling-docs-man-page-generation.patch
>>
>>
>> diff --git
>> a/meta/recipes-devtools/ccache/ccache/0001-doc-allow-disabling-docs-man-page-generation.patch
>> b/meta/recipes-devtools/ccache/ccache/0001-doc-allow-disabling-docs-man-page-generation.patch
>>
>> new file mode 100644
>> index 0000000000..11176e3039
>> --- /dev/null
>> +++
>> b/meta/recipes-devtools/ccache/ccache/0001-doc-allow-disabling-docs-man-page-generation.patch
>>
>> @@ -0,0 +1,161 @@
>> +From e87d882e8c31e4c6b90e770643c0d176c2455a01 Mon Sep 17 00:00:00 2001
>> +From: Bastian Krause <bst@pengutronix.de>
>> +Date: Tue, 4 May 2021 11:41:56 +0200
>> +Subject: [PATCH] doc: allow disabling docs/man page generation
>> +
>> +The assumption that HTML documentation and manual pages should be
>> +generated if the required tools (asciidoc) are present is not always
>> +true. So add a cmake option that allows disabling the docs/man page
>> +generation. The default is to generate docs/man pages like before.
>> +
>> +Origin: https://github.com/ccache/ccache/pull/844
>> +Upstream-Status: Pending
> 
> Just some nitpick, but shouldn't that be Submitted instead - as I see a
> PR open for this feature at the mentioned upstream repo
> 
> (see https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines)

You're right. Thanks for pointing that out. I'll fix this in a v2.

Regards,
Bastian

> 
>> +Signed-off-by: Bastian Krause <bst@pengutronix.de>
>> +---
>> + doc/CMakeLists.txt | 128 +++++++++++++++++++++++----------------------
>> + 1 file changed, 66 insertions(+), 62 deletions(-)
>> +
>> +diff --git a/doc/CMakeLists.txt b/doc/CMakeLists.txt
>> +index c5ce224d..74b7831b 100644
>> +--- a/doc/CMakeLists.txt
>> ++++ b/doc/CMakeLists.txt
>> +@@ -1,70 +1,74 @@
>> ++option(BUILD_DOCS "Indicates whether HTML documentation and manual
>> pages should be built or not" ON)
>> ++
>> + find_program(ASCIIDOC_EXE asciidoc)
>> + mark_as_advanced(ASCIIDOC_EXE) # Don't show in CMake UIs
>> +
>> +-if(NOT ASCIIDOC_EXE)
>> +-  message(WARNING "Could not find asciidoc; documentation will not
>> be generated")
>> +-else()
>> +-  #
>> +-  # HTML documentation
>> +-  #
>> +-  function(generate_html adoc_file)
>> +-    get_filename_component(base_name "${adoc_file}" NAME_WE)
>> +-    set(html_file "${base_name}.html")
>> +-    add_custom_command(
>> +-      OUTPUT "${html_file}"
>> +-      COMMAND
>> +-        ${ASCIIDOC_EXE}
>> +-          -o "${html_file}"
>> +-          -a revnumber="${CCACHE_VERSION}"
>> +-          -a toc
>> +-          -b xhtml11
>> +-          "${CMAKE_SOURCE_DIR}/${adoc_file}"
>> +-      MAIN_DEPENDENCY "${CMAKE_SOURCE_DIR}/${adoc_file}"
>> +-    )
>> +-    set(html_files "${html_files}" "${html_file}" PARENT_SCOPE)
>> +-  endfunction()
>> ++if (BUILD_DOCS)
>> ++  if(NOT ASCIIDOC_EXE)
>> ++    message(WARNING "Could not find asciidoc; documentation will not
>> be generated")
>> ++  else()
>> ++    #
>> ++    # HTML documentation
>> ++    #
>> ++    function(generate_html adoc_file)
>> ++      get_filename_component(base_name "${adoc_file}" NAME_WE)
>> ++      set(html_file "${base_name}.html")
>> ++      add_custom_command(
>> ++        OUTPUT "${html_file}"
>> ++        COMMAND
>> ++          ${ASCIIDOC_EXE}
>> ++            -o "${html_file}"
>> ++            -a revnumber="${CCACHE_VERSION}"
>> ++            -a toc
>> ++            -b xhtml11
>> ++            "${CMAKE_SOURCE_DIR}/${adoc_file}"
>> ++        MAIN_DEPENDENCY "${CMAKE_SOURCE_DIR}/${adoc_file}"
>> ++      )
>> ++      set(html_files "${html_files}" "${html_file}" PARENT_SCOPE)
>> ++    endfunction()
>> +
>> +-  generate_html(LICENSE.adoc)
>> +-  generate_html(doc/AUTHORS.adoc)
>> +-  generate_html(doc/MANUAL.adoc)
>> +-  generate_html(doc/NEWS.adoc)
>> ++    generate_html(LICENSE.adoc)
>> ++    generate_html(doc/AUTHORS.adoc)
>> ++    generate_html(doc/MANUAL.adoc)
>> ++    generate_html(doc/NEWS.adoc)
>> +
>> +-  add_custom_target(doc-html DEPENDS "${html_files}")
>> +-  set(doc_files "${html_files}")
>> ++    add_custom_target(doc-html DEPENDS "${html_files}")
>> ++    set(doc_files "${html_files}")
>> +
>> +-  #
>> +-  # Man page
>> +-  #
>> +-  find_program(A2X_EXE a2x)
>> +-  mark_as_advanced(A2X_EXE) # Don't show in CMake UIs
>> +-  if(NOT A2X_EXE)
>> +-    message(WARNING "Could not find a2x; man page will not be
>> generated")
>> +-  else()
>> +-    # MANUAL.adoc -> MANUAL.xml -> man page
>> +-    add_custom_command(
>> +-      OUTPUT MANUAL.xml
>> +-      COMMAND
>> +-        ${ASCIIDOC_EXE}
>> +-          -o -
>> +-          -a revnumber=${CCACHE_VERSION}
>> +-          -d manpage
>> +-          -b docbook "${CMAKE_SOURCE_DIR}/doc/MANUAL.adoc"
>> +-        | perl -pe 's!<literal>\(.*?\)</literal>!<emphasis
>> role="strong">\\1</emphasis>!g'
>> +-            >MANUAL.xml
>> +-      MAIN_DEPENDENCY "${CMAKE_SOURCE_DIR}/doc/MANUAL.adoc"
>> +-    )
>> +-    add_custom_command(
>> +-      OUTPUT ccache.1
>> +-      COMMAND ${A2X_EXE} --doctype manpage --format manpage MANUAL.xml
>> +-      MAIN_DEPENDENCY MANUAL.xml
>> +-    )
>> +-    add_custom_target(doc-man-page DEPENDS ccache.1)
>> +-    install(
>> +-      FILES "${CMAKE_CURRENT_BINARY_DIR}/ccache.1"
>> +-      DESTINATION "${CMAKE_INSTALL_MANDIR}/man1"
>> +-    )
>> +-    set(doc_files "${doc_files}" ccache.1)
>> +-  endif()
>> ++    #
>> ++    # Man page
>> ++    #
>> ++    find_program(A2X_EXE a2x)
>> ++    mark_as_advanced(A2X_EXE) # Don't show in CMake UIs
>> ++    if(NOT A2X_EXE)
>> ++      message(WARNING "Could not find a2x; man page will not be
>> generated")
>> ++    else()
>> ++      # MANUAL.adoc -> MANUAL.xml -> man page
>> ++      add_custom_command(
>> ++        OUTPUT MANUAL.xml
>> ++        COMMAND
>> ++          ${ASCIIDOC_EXE}
>> ++            -o -
>> ++            -a revnumber=${CCACHE_VERSION}
>> ++            -d manpage
>> ++            -b docbook "${CMAKE_SOURCE_DIR}/doc/MANUAL.adoc"
>> ++          | perl -pe 's!<literal>\(.*?\)</literal>!<emphasis
>> role="strong">\\1</emphasis>!g'
>> ++              >MANUAL.xml
>> ++        MAIN_DEPENDENCY "${CMAKE_SOURCE_DIR}/doc/MANUAL.adoc"
>> ++      )
>> ++      add_custom_command(
>> ++        OUTPUT ccache.1
>> ++        COMMAND ${A2X_EXE} --doctype manpage --format manpage
>> MANUAL.xml
>> ++        MAIN_DEPENDENCY MANUAL.xml
>> ++      )
>> ++      add_custom_target(doc-man-page DEPENDS ccache.1)
>> ++      install(
>> ++        FILES "${CMAKE_CURRENT_BINARY_DIR}/ccache.1"
>> ++        DESTINATION "${CMAKE_INSTALL_MANDIR}/man1"
>> ++      )
>> ++      set(doc_files "${doc_files}" ccache.1)
>> ++    endif()
>> +
>> +-  add_custom_target(doc ALL DEPENDS "${doc_files}")
>> ++    add_custom_target(doc ALL DEPENDS "${doc_files}")
>> ++  endif()
>> + endif()
>> +--
>> +2.29.2
>> +
>> diff --git a/meta/recipes-devtools/ccache/ccache_4.2.1.bb
>> b/meta/recipes-devtools/ccache/ccache_4.2.1.bb
>> index 90b9c6181f..8dd5893d68 100644
>> --- a/meta/recipes-devtools/ccache/ccache_4.2.1.bb
>> +++ b/meta/recipes-devtools/ccache/ccache_4.2.1.bb
>> @@ -11,7 +11,9 @@ LIC_FILES_CHKSUM =
>> "file://LICENSE.adoc;md5=698a26b57e513d678e1e7727bf56395b"
>>     DEPENDS = "zstd"
>>   -SRC_URI =
>> "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz"
>> +SRC_URI =
>> "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz \
>> +          
>> file://0001-doc-allow-disabling-docs-man-page-generation.patch \
>> +       "
>>   SRC_URI[sha256sum] =
>> "320d2b17d2f76393e5d4bb28c8dee5ca783248e9cd23dff0654694d60f8a4b62"
>>     UPSTREAM_CHECK_URI = "https://github.com/ccache/ccache/releases/"
>> @@ -21,3 +23,5 @@ inherit cmake
>>   PATCHTOOL = "patch"
>>     BBCLASSEXTEND = "native nativesdk"
>> +
>> +PACKAGECONFIG[docs] = "-DBUILD_DOCS=ON,-DBUILD_DOCS=OFF,asciidoc"
>>
>>
>>
>>
>>
> 
> 
> 
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
