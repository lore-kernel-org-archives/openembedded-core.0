Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <3daf5608-6a27-46c3-d44d-2a3ed4885800@gmail.com>
Date: Mon, 29 Nov 2021 17:44:42 +0100
MIME-Version: 1.0
Subject: Re: [OE-core] [RFC PATCH 4/9] perl/perlcross: Improve native reproducability
References: <20211128094532.1145820-1-jacob.kroon@gmail.com>
 <20211128094532.1145820-5-jacob.kroon@gmail.com>
 <CANNYZj99aiped+t0cgo+XTLQ=PnTW5yycD=Hyrfa+-EKGT8UWg@mail.gmail.com>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
In-Reply-To: <CANNYZj99aiped+t0cgo+XTLQ=PnTW5yycD=Hyrfa+-EKGT8UWg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>

On 11/29/21 10:07, Alexander Kanavin wrote:
> Can you split the determinism patch fix into a separate patch please?
> 

I don't know what exactly is the right fix here. Should both
"determinism.patch":es be applied when building perl-native ?

Jacob

> Alex
> 
> On Sun, 28 Nov 2021 at 10:46, Jacob Kroon <jacob.kroon@gmail.com
> <mailto:jacob.kroon@gmail.com>> wrote:
> 
>     In order to make perlcross-native independent of build path we need
>     to follow
>     the symlinks when copying the patches, otherwise they will point to
>     whereever
>     oe-core is checked out for that particular build.
> 
>     Doing this reveals an issue in perl-native, where it copies the patches
>     from perlcross-native's sysroot, but both perlcross and perl have a
>     patch called "determinism.patch", so one of them gets overridden. Rename
>     the patch in perlcross so that this doesn't happen.
> 
>     Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com
>     <mailto:jacob.kroon@gmail.com>>
>     ---
>      .../{determinism.patch => perl-cross-determinism.patch}      | 0
>      meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
>     <http://perlcross_1.3.6.bb>          | 4 ++--
>      meta/recipes-devtools/perl/perl_5.34.0.bb <http://perl_5.34.0.bb> 
>                       | 5 +++++
>      3 files changed, 7 insertions(+), 2 deletions(-)
>      rename meta/recipes-devtools/perl-cross/files/{determinism.patch =>
>     perl-cross-determinism.patch} (100%)
> 
>     diff --git
>     a/meta/recipes-devtools/perl-cross/files/determinism.patch
>     b/meta/recipes-devtools/perl-cross/files/perl-cross-determinism.patch
>     similarity index 100%
>     rename from meta/recipes-devtools/perl-cross/files/determinism.patch
>     rename to
>     meta/recipes-devtools/perl-cross/files/perl-cross-determinism.patch
>     diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
>     <http://perlcross_1.3.6.bb>
>     b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
>     <http://perlcross_1.3.6.bb>
>     index 2759ef8a53..dab7f4558f 100644
>     --- a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
>     <http://perlcross_1.3.6.bb>
>     +++ b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
>     <http://perlcross_1.3.6.bb>
>     @@ -15,7 +15,7 @@ SRC_URI =
>     "https://github.com/arsv/perl-cross/releases/download/${PV}/perl-cross
>     <https://github.com/arsv/perl-cross/releases/download/$%7BPV%7D/perl-cross>
>                
>     file://0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch \
>                
>     file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
>                
>     file://0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch \
>     -           file://determinism.patch \
>     +           file://perl-cross-determinism.patch \
>                
>     file://0001-cnf-configure_func_sel.sh-disable-thread_safe_nl_lan.patch \
>                
>     file://0001-Makefile-check-the-file-if-patched-or-not.patch \
>                 "
>     @@ -33,7 +33,7 @@ do_compile () {
> 
>      do_install:class-native() {
>          mkdir -p ${D}/${datadir}/perl-cross/
>     -    cp -rf ${S}/* ${D}/${datadir}/perl-cross/
>     +    cp -rfL ${S}/* ${D}/${datadir}/perl-cross/
>      }
> 
>      BBCLASSEXTEND = "native"
>     diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb
>     <http://perl_5.34.0.bb> b/meta/recipes-devtools/perl/perl_5.34.0.bb
>     <http://perl_5.34.0.bb>
>     index 16d45ccff3..0b74d5f072 100644
>     --- a/meta/recipes-devtools/perl/perl_5.34.0.bb <http://perl_5.34.0.bb>
>     +++ b/meta/recipes-devtools/perl/perl_5.34.0.bb <http://perl_5.34.0.bb>
>     @@ -97,6 +97,9 @@ do_configure:class-native() {
>          -Dvendorprefix=${prefix} \
>          -Ui_xlocale \
>          ${PACKAGECONFIG_CONFARGS}
>     +
>     +    # See the comment above
>     +    sed -i -e "s,${STAGING_DIR_NATIVE},/non/existent,g" config.h
>      }
> 
>      do_configure:append() {
>     @@ -395,3 +398,5 @@ SSTATE_HASHEQUIV_FILEMAP = " \
>          populate_sysroot:*/lib*/perl5/config.sh:${TMPDIR} \
>          populate_sysroot:*/lib*/perl5/config.sh:${COREBASE} \
>          "
>     +
>     +EXTRA_STAGING_FIXMES:append:class-native = " RPATH_PADDING"
> 
>     
> 
