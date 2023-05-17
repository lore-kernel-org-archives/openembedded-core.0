Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3399C7EE24
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 02:44:56 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.40948.1684291491504038217
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 19:44:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=uKliPzGl;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-52079a12451so101763a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 19:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684291490; x=1686883490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JcbpRlJaf76Tv7+sQeYiQ7L+XsqQNba6fhPiEgfiFV4=;
        b=uKliPzGlvzNBnoQaeDNn1Wm1PJ9/SBa+e3sk2DYb+4vv1Mko8vFbxm+vkBJEy0c533
         PNKSciGQzTuDkCnLdR2xF3vl43hW5hqrdYZY1DbdD/QErDLCpT92kT47Kj6rjvDFtdnX
         GIswTpXylDSrW0QzQCGIVRxodUeQk+Eqt7M0IkDvfLmPK6sigDk1oRfveribXkehSDye
         8L5QhJg16a1VepWDCddhqq1kH13K7nv/4r2pQ21oPQXqATkcHioqXnDv634RpBlonJt5
         W67jxvyOCXokkmM6ucxu1Q2JyLUD1k/jXm2A/oHYqbFd1dzpuGlt07LNWInYvlrZ+JDr
         xVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684291490; x=1686883490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JcbpRlJaf76Tv7+sQeYiQ7L+XsqQNba6fhPiEgfiFV4=;
        b=NT5laHd0hWcyo9OcSzML5jVmZzwOag4+0qAg1qpni3pxykGEWTSzi11G/y6Ipvrv5J
         4pvCPaeqO55QpSW+MZTaamQ6NwCyU42lZWW7+kcgq2mIsZHRr7xEy0Z1QzgmXz3rnR4K
         CZqTvqFkEkOkoOIU5y2Zud4egoLIHjnMnb9gKy1hQlu0BbxP9eD6CXQ0TiFrP9L31eQL
         8lQMAzQd3b+vppU+1Ro+dI4jQwQQ4hGTwMTTtJbMfIypBINC3yBo56udETGdakjaeYWU
         sIN/0a87143kyA/o2vaAdQFDRr3FHOcm6JwAKr1TWbCJvyUnFw6ejVuJKhaiQXH3Wuee
         wrpQ==
X-Gm-Message-State: AC+VfDz5Xbblg7oajV34lYyVXTLhG12ifN90HEoPlUv51rcdvvtaLF9i
	KP4bKT24hYFeqpnJTVbFaxNn6os345khRXMDAhk=
X-Google-Smtp-Source: ACHHUZ4IxWFxtVU1C+XhCDv+zLcIDiOUZ5NvtEIfNeQyNAGl96v06qcL8jB1Jy9B2AUcw8AuAk88Hw==
X-Received: by 2002:a17:903:552:b0:1ae:2013:4bc8 with SMTP id jo18-20020a170903055200b001ae20134bc8mr7280934plb.18.1684291490570;
        Tue, 16 May 2023 19:44:50 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id bj11-20020a170902850b00b001a2135e7eabsm16282767plb.16.2023.05.16.19.44.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 19:44:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 03/13] gtk4: update 4.10.0 -> 4.10.3
Date: Tue, 16 May 2023 16:44:26 -1000
Message-Id: <dfb50fff1e4e661fdda988d100682988cf7f4448.1684291329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684291329.git.steve@sakoman.com>
References: <cover.1684291329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 02:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181432

From: Markus Volk <f_l_k@t-online.de>

Overview of Changes in 4.10.3, 22-04-2023
=========================================

* Fix a popover positioning regression in 4.10.2

* Fix issues with slow loading files in the file chooser

Overview of Changes in 4.10.2, 21-04-2023
=========================================

* Fixed issues:
 - Holding control to select multiple files broken in filechooser (#5669)
 - Inspector crash (#5681)
 - Listbase doesn't account for bottom padding in size_allocate_child (#5380)
 - Leaking AT contexts (#5690)
 - OpenGL / Windows: Crash when closing gtk4-widget-factory (#5685)
 - GTK apps crash on startup when setting cursor-size to 0 on Wayland (#5700)
 - Segmentation fault: gdk_wayland_toplevel_set_startup_id() needs to null-check
   display->xdg_activation before using it (#5701)
 - Possible use-after-free under gtk_scrolled_window_update_use_indicators() (#5684)
 - Wrong error message in `gtk_init` (#5704)
 - Segfault when scrolling after changing ListView model (#5763)
 - Bluetooth panel from the Settings app: clicking in the "Downloads" link
   no longer opens Nautilus (#5671)
 - Broadway docs or code is broken (#5662)
 - Disabled GtkPicture's are not properly themed (#5683)
 - Setting CSS padding to a GtkTextView gives the context menu an offset (#5695)
 - A11y: the Showing state is used only for windows (#5194)
 - Gtk4 expander: CSS nodes mismatch code vs. documentation (#5723)
 - Invoking gtk inspector on a folder results in a crash (#5729)
 - Double tap requires very precise touch input (#5580)
 - Name autocompletion dropdown in the GTK4 FileChooser's Save dialog gets
   stuck, creates artifacts, jumps around (#5743)
 - Links are not opened when xdg-desktop-portal OpenURI is not available (#5733)
 - GtkSnapshot generates no nodes appending whitespace-only layouts (#5747)

* Translation updates
 British English
 Bulgarian
 Chinese (China)
 French
 Indonesian
 Korean
 Russian
 Serbian
 Slovenian
 Turkish

Overview of Changes in 4.10.1, 14-03-2023
=========================================

* GtkFileChooser
 - Improve search performance
 - Be safe against pathless files
 - Fix memory leaks
 - Only show local files in recent files
 - Show most recent files first
 - Make files non-selectable in selet_folder mode

* GtkListView / GtkColumnView / GtkGridView
 - Fix scrolling problems
 - Support CSS border-spacing

* GtkComboBox
 - Fix a size allocation problem

* gtk
 - Size allocation fixes

* Accessibility
 - Miscellaneous property fixes and improvements

* Wayland
 - Fix an ordering problem in surface disposal

* Windows
 - Fix Visual Studio build with older GLib

* Translation updates
 Basque
 Bulgarian
 Catalan
 Czech
 Danish
 Finnish
 Friulian
 Galician
 Georgian
 Hungarian
 Lithuanian
 Polish
 Portuguese
 Swedish
 Turkish
 Ukrainian

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0f07445de85c71926e0901d051d330f29a8486d6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-gnome/gtk+/{gtk4_4.10.0.bb => gtk4_4.10.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.10.0.bb => gtk4_4.10.3.bb} (98%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.10.0.bb b/meta/recipes-gnome/gtk+/gtk4_4.10.3.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.10.0.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.10.3.bb
index d58fe149ec..9aa33e6851 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.10.0.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.10.3.bb
@@ -37,7 +37,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX = "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
-SRC_URI[sha256sum] = "8dc1e7c3b3a46772f0fa416a8ca3fd21d0d0b3b03fb307d2e7327ebee69626e4"
+SRC_URI[sha256sum] = "4545441ad79e377eb6e0a705026dc7a46886e46a1b034db40912909da801cea9"
 
 S = "${WORKDIR}/gtk-${PV}"
 
-- 
2.34.1


