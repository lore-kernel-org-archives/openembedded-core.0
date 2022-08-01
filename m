Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC35C00144
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 14:56:29 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web08.25819.1659365784313969027
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 07:56:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=gSKNMP2e;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.44,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f44.google.com with SMTP id b16so6588258edd.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 07:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+aihiRV+2VUHh3fpsu4WtP07NMuMr0qLn8/exuxKIRQ=;
        b=gSKNMP2ejgjTcf2lZW8HU7gPmCLS1DdqItyvrl/dLajIHmlI5WAhizcahpihxuSrPR
         AI0FfPfzSqgTjvhnsA+f9YwYfSA37LuJqUfmPadnBBY4bwHgDHsjvMro8E4PC/MfZQqD
         UznnzQGeea50qtyKfxVnCtiX/p9obDBLNE717sJtFU9UbyWpo8Vu2EGCdDVsk5L2yjz8
         WCygoZm6xtcUrStGsuULiTdTFo7AuyzHjEHnYQ9UyvEZynu7uRD/qLYcwmeSWWSwiwxn
         y26ZHymKUQiH9+EXq0d7PBDWEdfao/NzFwWvrsHseAK3AL6Zk3rQby2gwIWeNbAn8VjB
         fw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+aihiRV+2VUHh3fpsu4WtP07NMuMr0qLn8/exuxKIRQ=;
        b=5yswkSY/+w3XZugeQf5j/z/IzJkcuqBJ9lldNJAyPz6bvU2rPnVJxTTpf+QXU4dl3A
         WXhYqRQOrV/DIe8IxAguBGafu/AbVoVOPaY65iKPPcwLFOhvZYZJAyACWPoixtjZYd7K
         M8n7pIA1yn+Rxzy7otQN3ckgk4fxlfUXAqb4ccpbjjMkqOacxf3Y8NKgy7A5PDM3pPzA
         +L0OmmpPbxbQ/nwwNCSWFYYTT6kf5mUyrmk8OSGMF8IEbkLK5F084J5wmAxxORsmhg6I
         pOOTNWZZI8/rSHSXeIDmcTL1IOQ2lFGgDq2OCU1MJXkpAQ6wN1FaAXAh8D/4AfEy5L2d
         OFCg==
X-Gm-Message-State: AJIora8GkeuwIvsdBHvgzdrjLDM9UCvGB2zdae0EXik1K2pokHLWWkiB
	jEJB4I5PweEV/soW+H0V7cA4G6Q8K/X6tnFACDAliA==
X-Google-Smtp-Source: 
 AGRyM1upxravgYqa13MIuP6VEylUogWRF2HK85IeLiTgHQyS3oBCxW6iLDFms5gXWms9+r1a1lA3ASHxzeTUgxI5Q5Y=
X-Received: by 2002:a05:6402:5193:b0:43b:e957:cdef with SMTP id
 q19-20020a056402519300b0043be957cdefmr16346756edd.345.1659365782553; Mon, 01
 Aug 2022 07:56:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220801044403.6009-1-hprajapati@mvista.com>
In-Reply-To: <20220801044403.6009-1-hprajapati@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 1 Aug 2022 04:56:11 -1000
Message-ID: 
 <CAOSpxdZtNMQ7cMy8_L-CQp1Ukc0o=XRTM+9=wEHyLKkNvcXOBA@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] python3-lxml: CVE-2022-2309 NULL
 Pointer Dereference allows attackers to cause a denial of service
To: Hitendra Prajapati <hprajapati@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 14:56:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168752

Wrong list :-)

This is a patch for meta-openembedded and should be sent to:
openembedded-devel@lists.openembedded.org

Steve


On Sun, Jul 31, 2022 at 6:44 PM Hitendra Prajapati
<hprajapati@mvista.com> wrote:
>
> Source: https://github.com/lxml/lxml
> MR: 119399
> Type: Security Fix
> Disposition: Backport from https://github.com/lxml/lxml/commit/86368e9cf70a0ad23cccd5ee32de847149af0c6f
> ChangeID: 0b1ef4ce4c901ef6574a83ecbe4c4b1d2ab24777
> Description:
>         CVE-2022-2309 libxml: NULL Pointer Dereference allows attackers to cause a denial of service.
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../recipes-devtools/python/python-lxml.inc   |  2 +
>  .../python/python3-lxml/CVE-2022-2309.patch   | 94 +++++++++++++++++++
>  2 files changed, 96 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-lxml/CVE-2022-2309.patch
>
> diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
> index 05b5eae462..0276a3e81a 100644
> --- a/meta-python/recipes-devtools/python/python-lxml.inc
> +++ b/meta-python/recipes-devtools/python/python-lxml.inc
> @@ -18,6 +18,8 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
>
>  DEPENDS += "libxml2 libxslt"
>
> +SRC_URI += "file://CVE-2022-2309.patch"
> +
>  SRC_URI[md5sum] = "f088e452ed45b030b6f84269f1e84d11"
>  SRC_URI[sha256sum] = "8620ce80f50d023d414183bf90cc2576c2837b88e00bea3f33ad2630133bbb60"
>
> diff --git a/meta-python/recipes-devtools/python/python3-lxml/CVE-2022-2309.patch b/meta-python/recipes-devtools/python/python3-lxml/CVE-2022-2309.patch
> new file mode 100644
> index 0000000000..ff3fcee6e2
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-lxml/CVE-2022-2309.patch
> @@ -0,0 +1,94 @@
> +From ccbda4b0669f418b2f00c4f099733cebe633eb47 Mon Sep 17 00:00:00 2001
> +From: Hitendra Prajapati <hprajapati@mvista.com>
> +Date: Fri, 29 Jul 2022 10:16:59 +0530
> +Subject: [PATCH] CVE-2022-2309
> +
> +Upstream-Status: Backport [https://github.com/lxml/lxml/commit/86368e9cf70a0ad23cccd5ee32de847149af0c6f]
> +CVE: CVE-2022-2309
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + src/lxml/apihelpers.pxi      |  7 ++++---
> + src/lxml/iterparse.pxi       | 11 ++++++-----
> + src/lxml/tests/test_etree.py | 20 ++++++++++++++++++++
> + 3 files changed, 30 insertions(+), 8 deletions(-)
> +
> +diff --git a/src/lxml/apihelpers.pxi b/src/lxml/apihelpers.pxi
> +index 5eb3416..88a031d 100644
> +--- a/src/lxml/apihelpers.pxi
> ++++ b/src/lxml/apihelpers.pxi
> +@@ -246,9 +246,10 @@ cdef dict _build_nsmap(xmlNode* c_node):
> +     while c_node is not NULL and c_node.type == tree.XML_ELEMENT_NODE:
> +         c_ns = c_node.nsDef
> +         while c_ns is not NULL:
> +-            prefix = funicodeOrNone(c_ns.prefix)
> +-            if prefix not in nsmap:
> +-                nsmap[prefix] = funicodeOrNone(c_ns.href)
> ++            if c_ns.prefix or c_ns.href:
> ++                prefix = funicodeOrNone(c_ns.prefix)
> ++                if prefix not in nsmap:
> ++                    nsmap[prefix] = funicodeOrNone(c_ns.href)
> +             c_ns = c_ns.next
> +         c_node = c_node.parent
> +     return nsmap
> +diff --git a/src/lxml/iterparse.pxi b/src/lxml/iterparse.pxi
> +index 4c20506..3da7485 100644
> +--- a/src/lxml/iterparse.pxi
> ++++ b/src/lxml/iterparse.pxi
> +@@ -419,7 +419,7 @@ cdef int _countNsDefs(xmlNode* c_node):
> +     count = 0
> +     c_ns = c_node.nsDef
> +     while c_ns is not NULL:
> +-        count += 1
> ++        count += (c_ns.href is not NULL)
> +         c_ns = c_ns.next
> +     return count
> +
> +@@ -430,9 +430,10 @@ cdef int _appendStartNsEvents(xmlNode* c_node, list event_list) except -1:
> +     count = 0
> +     c_ns = c_node.nsDef
> +     while c_ns is not NULL:
> +-        ns_tuple = (funicode(c_ns.prefix) if c_ns.prefix is not NULL else '',
> +-                    funicode(c_ns.href))
> +-        event_list.append( (u"start-ns", ns_tuple) )
> +-        count += 1
> ++        if c_ns.href:
> ++            ns_tuple = (funicodeOrEmpty(c_ns.prefix),
> ++                        funicode(c_ns.href))
> ++            event_list.append( (u"start-ns", ns_tuple) )
> ++            count += 1
> +         c_ns = c_ns.next
> +     return count
> +diff --git a/src/lxml/tests/test_etree.py b/src/lxml/tests/test_etree.py
> +index b997e4d..69e1bf1 100644
> +--- a/src/lxml/tests/test_etree.py
> ++++ b/src/lxml/tests/test_etree.py
> +@@ -1448,6 +1448,26 @@ class ETreeOnlyTestCase(HelperTestCase):
> +             [1,2,1,4],
> +             counts)
> +
> ++    def test_walk_after_parse_failure(self):
> ++        # This used to be an issue because libxml2 can leak empty namespaces
> ++        # between failed parser runs.  iterwalk() failed to handle such a tree.
> ++        try:
> ++            etree.XML('''<anot xmlns="1">''')
> ++        except etree.XMLSyntaxError:
> ++            pass
> ++        else:
> ++            assert False, "invalid input did not fail to parse"
> ++
> ++        et = etree.XML('''<root>  </root>''')
> ++        try:
> ++            ns = next(etree.iterwalk(et, events=('start-ns',)))
> ++        except StopIteration:
> ++            # This would be the expected result, because there was no namespace
> ++            pass
> ++        else:
> ++            # This is a bug in libxml2
> ++            assert not ns, repr(ns)
> ++
> +     def test_itertext_comment_pi(self):
> +         # https://bugs.launchpad.net/lxml/+bug/1844674
> +         XML = self.etree.XML
> +--
> +2.25.1
> +
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168693): https://lists.openembedded.org/g/openembedded-core/message/168693
> Mute This Topic: https://lists.openembedded.org/mt/92741215/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

