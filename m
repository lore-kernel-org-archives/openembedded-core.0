Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B60C636CC
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 20:48:01 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.5553.1676839672602835216
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 12:47:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G4vmITFG;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id a33so1291948ljr.7
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 12:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MQI3G6Cz3oxU9N30paQMHtUG+Z2kSpuiDaZtJ+5LA/s=;
        b=G4vmITFGNXU1oz1VbnL5Qj8B+TjWm/1aTuOwUwm/coX5/iaU9mtgGeC2FRvGQ0Gt25
         YeWVlXXii4i3BxcVmJAcMdYGNVfdSQ1p8wzC6eRaqhN8cjiU7p03nZzwIgVGspp9ianE
         WuVUlTTLOnB+wQ27R64dJmkewUkKsSPrIeTFeIodTCQHrmNVX783ZJP/289bgXI0gWcS
         4LSSUSuUh1l7wPJFNgEyO5azoQaXF134f+13sqJccnmpEyke9fpq8UByxkKGHmbz+/sE
         tDIfceQ1S7xhvrbeY+wd8ZbQsO2ddiXY2GIo8Lkahgq7NVRq7V3v3i52jT3xyls/YLoR
         PFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQI3G6Cz3oxU9N30paQMHtUG+Z2kSpuiDaZtJ+5LA/s=;
        b=DmxC1UbIFMrrQgr/1LQf/9SDzcrVTSld+VUWR6pioiogxXCM/9z9yD0cDTkoFSUI2p
         sb3DdC5si+T1rYCiDr/ZaFF5tgeL2sIJ5dlEA5ZpgBJ0EhwVI4fITIBDgviYZH+M9pc4
         rF/557QgwzLyDVRbAxoBtD/shibohVu4yr2fspFVkwP5Sado8GCLuTA8O6x5aJr73xrv
         cgK3/sZsp3BMCKJBhupIsJFn+p6Feegks5okuWtzsA2Qe+Ci4mnA1IqdidBMwTSBJnjl
         eGN9cYxDaFvWMnhyv5QilgPfC6/pSZlIMD/zWkfvARLzbczRFUP8NLKVhmvrNvLG2cTp
         w66Q==
X-Gm-Message-State: AO0yUKWXzLmvQqxO3TVyyOmLGkNKKrXEAZwpgdUB9BlXp4+AUqzII5y0
	szV6/DwUumytIE7m/X119YznK9y3sxcwrziSPRA=
X-Google-Smtp-Source: AK7set/LITVjx+Lzo1CAmOYfGH3CdhHy5pruQ5QLPDlCWIqPvIGRu+Nti5MrrbXlZz1zCqygytUgIY0YjsinAUILTP8=
X-Received: by 2002:a2e:b753:0:b0:28e:54f:b187 with SMTP id
 k19-20020a2eb753000000b0028e054fb187mr24105ljo.5.1676839670359; Sun, 19 Feb
 2023 12:47:50 -0800 (PST)
MIME-Version: 1.0
References: <20230219112522.3391653-2-rich@richelberger.com>
 <20230219112522.3391653-1-rich@richelberger.com> <01000186696bfbd6-6ba3a526-b53d-4775-94cf-0b29b19f44dc-000000@email.amazonses.com>
 <747cdeab-f37e-6bd2-ea9d-3038d94372a1@richelberger.com> <CANNYZj_PtQ4yVdy1XspGKKAmZE4Mgfmm8D+5gf6D8mGMrc36ng@mail.gmail.com>
 <010001866a8456a4-0d51027d-5588-4b3e-af46-9e09b84cfe2f-000000@email.amazonses.com>
 <1e455822-8e68-5e30-72b8-c4c1d18acb48@richelberger.com> <CANNYZj8ejnyhpF9UBaHr6=CVZNxVNxjjQmpdxkut9oH0i33AjQ@mail.gmail.com>
 <010001866ae9a28c-9050cb24-ba3f-4a9b-b8c5-a00bc936efbf-000000@email.amazonses.com>
 <17454DD71A4E7B0B.32742@lists.openembedded.org> <2b4a87bc-d5ca-800f-852f-414070ed31ff@richelberger.com>
 <CANNYZj9+6uQjy=5+rWfYBBmzfwJQHB4YNWH3-DAEunB+mdrinw@mail.gmail.com>
 <010001866b5c73fa-530eb0cc-1137-4ccf-8ee7-aff4434b46ea-000000@email.amazonses.com>
 <eba0a002-efcb-3bde-e46d-d88c07bc9b2c@richelberger.com> <CANNYZj8kF=W8LBP7zyyYRrJiPUkxcaXqxc87PBiQCBXu1ksNTA@mail.gmail.com>
 <010001866b6d0a7c-d5d7db67-d8a0-421b-bdda-e1b7130bbaae-000000@email.amazonses.com>
In-Reply-To: <010001866b6d0a7c-d5d7db67-d8a0-421b-bdda-e1b7130bbaae-000000@email.amazonses.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 19 Feb 2023 21:47:38 +0100
Message-ID: <CANNYZj83GH1=vHN1D3PcdXDTnq45122_2BLrdgp7=o8cAjMLHA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] [YOCTO #13270] Refactor the docbook-xml recipe
 to use docbook.org packages rather than hacked up debian package
To: Richard Elberger <rich@richelberger.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 20:48:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177386

The version check is working fine with the existing recipe, and it
will stop working with your patch. So you need to get it fixed.

Alex

On Sun, 19 Feb 2023 at 21:45, Richard Elberger <rich@richelberger.com> wrote:
>
> I think doing this is out of scope of the bugfix. The latest-version
> check was not a constraint in the prior version.
>
> I suggest that we get the bug fixed and file another workitem for this
> particular ask.
>
> On 2/19/23 15:39, Alexander Kanavin wrote:
> > 412 can be specifically excluded as a 'bogus' version, examples exist
> > in oe-core.
> >
> > Version checks are used for manual upgrades too, as maintainers want
> > to be notified there's a new version, even if autoupgrade can't handle
> > it. We just need to know if there's a 4.x release newer than 4.5, and
> > that can be covered by the check.
> >
> > Alex
> >
> > On Sun, 19 Feb 2023 at 21:27, Richard Elberger <rich@richelberger.com> wrote:
> >> I have been working on it, but after a while I realized that this
> >> version upgrade will not work anyway - even for 4.x
> >>
> >> The reason is they have a folder named "412" which is actually 4.1.2
> >> which I we probably still need to have in.
> >>
> >> Even though the tool cannot find 5.2 it still exits zero ... but still,
> >> it thinks that 412 > 5.2
> >>
> >> I see one of two things a/ do not autoupgrade and somehow mark for
> >> manual cyclical update b/ somehow apply a map capability
> >>
> >> Also given that multiple versions must be delivered in the same version
> >> I don't think that this falls under typical autoupgrade scenario.
> >>
> >> What are your thoughts?
> >>
> >> On 2/19/23 13:54, Alexander Kanavin wrote:
> >>> If the check goes over https://docbook.org/xml/ I guess you can set
> >>> the regex to 4.x versions only, as the recipe name itself pins it to
> >>> 4.x. I'm not sure we're even going to need 5.x, ever.
> >>> You can grep for UPSTREAM_CHECK_REGEX in core for examples.
> >>>
> >>> Alex
> >>>
> >>> On Sun, 19 Feb 2023 at 19:40, Alexander Kanavin via
> >>> lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
> >>> wrote:
> >>>> It helps if you provide devtool's output. I think it's possible to
> >>>> exclude rc versions from the check with UPSTREAM_CHECK_REGEX.
> >>>>
> >>>> Alex
> >>>>
> >>>> On Sun, 19 Feb 2023 at 19:22, Richard Elberger <rich@richelberger.com> wrote:
> >>>>> I tried `devtool latest-version` and it failed on one version - 5.2 -
> >>>>> because it's still in RC.
> >>>>>
> >>>>> Note that there are massive breaking changes between Docbook 4x and 5x.
> >>>>> Given the defect I'm fixing is to change the upstream source - and not
> >>>>> refactor the entire recipe - I believe the scope should keep to that and
> >>>>> another defect filed for future versions. Please confirm this is
> >>>>> reasonable.
> >>>>>
> >>>>> I did the other beatification changes per style guide and will resubmit
> >>>>> once I get confirmation.
> >>>>>
> >>>>> On 2/19/23 12:31, Alexander Kanavin wrote:
> >>>>>> On Sun, 19 Feb 2023 at 17:31, Richard Elberger <rich@richelberger.com> wrote:
> >>>>>>
> >>>>>>> For multiple assignment: the reason is maintainability. The supported
> >>>>>>> versions will change over time.
> >>>>>> You can still place them in a newline-separated single assignment,
> >>>>>> which is a lot more readable as the list of fetched items is then in a
> >>>>>> single location in the recipe.
> >>>>>> This is how all recipes in oe-core are structured.
> >>>>>>
> >>>>>>> Please confirm if there are any other appreciations I must cover - I was
> >>>>>>> unaware of this one and would like to batch them. If the appreciations
> >>>>>>> are listed on a wiki please school me about that.
> >>>>>> For now I do not have any others. I'd like to see a v2 first, as v1
> >>>>>> makes it hard to understand how the final recipe looks like with the
> >>>>>> multiple SRC_URI approach. We used to have a bot that points out
> >>>>>> common issues but it's unmaintained and falled into disrepair.
> >>>>>>
> >>>>>> There are numerous pages on the wiki collecting style and message tips:
> >>>>>> https://www.openembedded.org/wiki/Styleguide
> >>>>>> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> >>>>>> https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
> >>>>>>
> >>>>>> Alex
> >>>>>>
> >>>>>>> On 2/19/23 10:52, Alexander Kanavin wrote:
> >>>>>>>> Can you please set SRC_URI with a single assignment; there is no
> >>>>>>>> reason to += it multiple times.
> >>>>>>>>
> >>>>>>>> Verifying that 'devtool latest-version works' would be also appreciated.
> >>>>>>>>
> >>>>>>>> Alex
> >>>>>>>>
> >>>>>>>> On Sun, 19 Feb 2023 at 12:25, Richard Elberger <rich@richelberger.com> wrote:
> >>>>>>>>> ---
> >>>>>>>>>      .../docbook-xml/docbook-xml-dtd4_4.5.bb       | 74 ++++++++++++-------
> >>>>>>>>>      1 file changed, 49 insertions(+), 25 deletions(-)
> >>>>>>>>>
> >>>>>>>>> diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
> >>>>>>>>> index 2bec1442af..71aa8c14ec 100644
> >>>>>>>>> --- a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
> >>>>>>>>> +++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
> >>>>>>>>> @@ -1,30 +1,54 @@
> >>>>>>>>>      SUMMARY = "Document type definitions for verification of XML data files"
> >>>>>>>>>      DESCRIPTION = "Document type definitions for verification of XML data \
> >>>>>>>>> -files against the DocBook rule set, it ships with the latest DocBook 4.5 \
> >>>>>>>>> -XML DTD, as well as a selected set of legacy DTDs for use with older \
> >>>>>>>>> -documents, including 4.0, 4.1.2, 4.2, 4.3 and 4.4"
> >>>>>>>>> -HOMEPAGE = "http://www.docbook.org/xml/"
> >>>>>>>>> +files against the DocBook rule set."
> >>>>>>>>> +HOMEPAGE = "https://docbook.org"
> >>>>>>>>>
> >>>>>>>>> -LICENSE = "OASIS"
> >>>>>>>>> -LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE-OASIS;md5=c608985dd5f7f215e669e7639a0b1d2e"
> >>>>>>>>> +inherit allarch
> >>>>>>>>> +BBCLASSEXTEND = "native"
> >>>>>>>>>
> >>>>>>>>> -# Note: the upstream sources are not distributed with a license file.
> >>>>>>>>> -# LICENSE-OASIS is included as a "patch" to workaround this. When
> >>>>>>>>> -# upgrading this recipe, please verify whether this is still needed.
> >>>>>>>>> -SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/d/docbook-xml/docbook-xml_${PV}.orig.tar.gz \
> >>>>>>>>> -           file://LICENSE-OASIS \
> >>>>>>>>> -           file://docbook-xml-update-catalog.xml.patch \
> >>>>>>>>> -"
> >>>>>>>>> +# To support apps with xml schema backward compatibility, we must
> >>>>>>>>> +# install a set of schemas. Install the latest based on PV and then
> >>>>>>>>> +# name any specific versions as required. TODO: Figure out a mechanism
> >>>>>>>>> +# to filter exactly which versions are necessary, if that's even
> >>>>>>>>> +# possible.
> >>>>>>>>> +#
> >>>>>>>>> +# DocBook.org lists available packages at https://docbook.org/xml/
> >>>>>>>>> +#
> >>>>>>>>> +# These packages are available as source but it requires the ability
> >>>>>>>>> +# to use the Gradle build system to do so. It might be safer to use
> >>>>>>>>> +# the source tree which would also enable proper SBOM generation
> >>>>>>>>> +# through the bitbake build system. https://github.com/docbook/docbook
> >>>>>>>>> +#
> >>>>>>>>>
> >>>>>>>>> -SRC_URI[md5sum] = "487b4d44e15cffb1f4048af23f98208e"
> >>>>>>>>> -SRC_URI[sha256sum] = "b0f8edcf697f5318e63dd98c9a931f3fee167af0805ba441db372e0f17b2a44f"
> >>>>>>>>> +S = "${WORKDIR}"
> >>>>>>>>>
> >>>>>>>>> -UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/docbook-xml/"
> >>>>>>>>> +SRC_URI += "https://docbook.org/xml/4.1.2/docbkx412.zip;name=payload412;subdir=docbook-xml-4.1.2"
> >>>>>>>>> +SRC_URI[payload412.md5sum] = "900d7609fb7e6d78901b357e4acfbc17"
> >>>>>>>>> +SRC_URI[payload412.sha256sum] = "30f0644064e0ea71751438251940b1431f46acada814a062870f486c772e7772"
> >>>>>>>>>
> >>>>>>>>> -S = "${WORKDIR}/docbook-xml-4.5.c31424"
> >>>>>>>>> +SRC_URI += "https://docbook.org/xml/4.2/docbook-xml-4.2.zip;name=payload42;subdir=docbook-xml-4.2"
> >>>>>>>>> +SRC_URI[payload42.md5sum] = "73fe50dfe74ca631c1602f558ed8961f"
> >>>>>>>>> +SRC_URI[payload42.sha256sum] = "acc4601e4f97a196076b7e64b368d9248b07c7abf26b34a02cca40eeebe60fa2"
> >>>>>>>>>
> >>>>>>>>> -inherit allarch
> >>>>>>>>> -BBCLASSEXTEND = "native"
> >>>>>>>>> +SRC_URI += "https://docbook.org/xml/4.3/docbook-xml-4.3.zip;name=payload43;subdir=docbook-xml-4.3"
> >>>>>>>>> +SRC_URI[payload43.md5sum] = "ab200202b9e136a144db1e0864c45074"
> >>>>>>>>> +SRC_URI[payload43.sha256sum] = "23068a94ea6fd484b004c5a73ec36a66aa47ea8f0d6b62cc1695931f5c143464"
> >>>>>>>>> +
> >>>>>>>>> +SRC_URI += "https://docbook.org/xml/4.4/docbook-xml-4.4.zip;name=payload44;subdir=docbook-xml-4.4"
> >>>>>>>>> +SRC_URI[payload44.md5sum] = "cbb04e9a700955d88c50962ef22c1634"
> >>>>>>>>> +SRC_URI[payload44.sha256sum] = "02f159eb88c4254d95e831c51c144b1863b216d909b5ff45743a1ce6f5273090"
> >>>>>>>>> +
> >>>>>>>>> +SRC_URI += "https://docbook.org/xml/${PV}/docbook-xml-${PV}.zip;name=payloadPV;subdir=docbook-xml-${PV}"
> >>>>>>>>> +SRC_URI[payloadPV.md5sum] = "03083e288e87a7e829e437358da7ef9e"
> >>>>>>>>> +SRC_URI[payloadPV.sha256sum] = "4e4e037a2b83c98c6c94818390d4bdd3f6e10f6ec62dd79188594e26190dc7b4"
> >>>>>>>>> +
> >>>>>>>>> +# The upstream sources are not distributed with a license file.
> >>>>>>>>> +# LICENSE-OASIS is included as a "patch" to workaround this. When
> >>>>>>>>> +# upgrading this recipe, please verify whether this is still needed.
> >>>>>>>>> +
> >>>>>>>>> +LICENSE = "OASIS"
> >>>>>>>>> +LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE-OASIS;md5=c608985dd5f7f215e669e7639a0b1d2e"
> >>>>>>>>> +SRC_URI += "file://LICENSE-OASIS"
> >>>>>>>>>
> >>>>>>>>>      do_configure (){
> >>>>>>>>>          :
> >>>>>>>>> @@ -34,19 +58,19 @@ do_compile (){
> >>>>>>>>>          :
> >>>>>>>>>      }
> >>>>>>>>>
> >>>>>>>>> +inherit xmlcatalog
> >>>>>>>>> +
> >>>>>>>>>      do_install () {
> >>>>>>>>>          install -d ${D}${sysconfdir}/xml/
> >>>>>>>>>          xmlcatalog --create --noout ${D}${sysconfdir}/xml/docbook-xml.xml
> >>>>>>>>>
> >>>>>>>>> -    for DTDVERSION in 4.0 4.1.2 4.2 4.3 4.4 4.5; do
> >>>>>>>>> +    for DTDVERSION in 4.1.2 4.2 4.3 4.4 4.5; do
> >>>>>>>>>              DEST=${datadir}/xml/docbook/schema/dtd/$DTDVERSION
> >>>>>>>>>              install -d -m 755 ${D}$DEST
> >>>>>>>>> -        cp -v -R docbook-$DTDVERSION/* ${D}$DEST
> >>>>>>>>> -        xmlcatalog --verbose --noout --add nextCatalog unused file://$DEST/catalog.xml ${D}${sysconfdir}/xml/docbook-xml.xml
> >>>>>>>>> +        cp -v -R docbook-xml-$DTDVERSION/* ${D}$DEST
> >>>>>>>>> +        xmlcatalog --verbose --noout --add nextCatalog unused \
> >>>>>>>>> +          file://$DEST/catalog.xml ${D}${sysconfdir}/xml/docbook-xml.xml
> >>>>>>>>>          done
> >>>>>>>>>      }
> >>>>>>>>>
> >>>>>>>>> -XMLCATALOGS = "${sysconfdir}/xml/docbook-xml.xml"
> >>>>>>>>> -inherit xmlcatalog
> >>>>>>>>> -
> >>>>>>>>>      FILES:${PN} = "${datadir}/* ${sysconfdir}/xml/docbook-xml.xml"
> >>>>>>>>> --
> >>>>>>>>> 2.34.1
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>>
> >>>> -=-=-=-=-=-=-=-=-=-=-=-
> >>>> Links: You receive all messages sent to this group.
> >>>> View/Reply Online (#177342): https://lists.openembedded.org/g/openembedded-core/message/177342
> >>>> Mute This Topic: https://lists.openembedded.org/mt/97064586/1686489
> >>>> Group Owner: openembedded-core+owner@lists.openembedded.org
> >>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> >>>> -=-=-=-=-=-=-=-=-=-=-=-
> >>>>
>

