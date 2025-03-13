Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456BFC282EC
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 16:40:22 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.19681.1741884019194015053
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 09:40:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TrYTcGro;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-47686580529so11253391cf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 09:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741884018; x=1742488818; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1y1D7VeWli6ToEoQ09KJ8XfUdF/7qyn2ZUaZ8Jp9xsM=;
        b=TrYTcGroiIGncRNFzoDn3PjRlUMo2Hl0Wtw1FIEr/dKR07sEYuq1MkDqKvz6BNUPj+
         mnU90j8Bq/4QslzD+WX3MfPyITaKJL5aFG8OVOgOAx6gVX8OqlbhQNWB2zpdEgt7d0Xt
         glbMMyh0aI2f8h3UQXSojoaG3Cl5G4JIGXy9LF5oR8UCVpPZOkAUuxM1T+/uaB356BXN
         E5yJDaAwiZYrcHLzSoiTQd01HSzdY72vJpHjn76KdLBs91vw6gPl7NulOz1z1bcWtWfs
         uCgI0ka/5WJwdEV54bHeEtjYU3vTzexg+MegjNqGAot1ulPE2nqzZzCAX8LOa7CDtgos
         BPnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741884018; x=1742488818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1y1D7VeWli6ToEoQ09KJ8XfUdF/7qyn2ZUaZ8Jp9xsM=;
        b=L6qMRv0+lCX0MkZDPC4NFqFgpHNk7PIC4azLilflthE2Iw1p0gLhj9znlIuSEj2eLE
         mg5JfXdPDuFGaInlwmBbBbCy++Dwon9D90V7QAebR6Qu+FHrVhTb51Tqq1zDFKHdQ1q3
         8yhTA2cbWK7LWBMtMrbdGPEylv+YjF3mhNIc9/tkWntGxRxhVtaZzvL9ZyoFKAJNUMOr
         Q/yJwa+U7/GumV4J+Wp++b2M3aZ+oZsr4usHJj56HrTl/vU1miKaiPbYdJtVe3EJFfXO
         DXuwrh3O7ePAMXJuZLOGV45hPVCRlKum+0EbahkKq8NtJuvG+BNR+Zbl+zQS0ThHqa32
         6YPw==
X-Gm-Message-State: AOJu0YyT4uuailPZOcDW+OBH3Wxc1W2ibpqSB0dPETt5RNRxx1Eobrn2
	Ha6sOYTCYzjBSYbp+U4k2L8ATfdoiuocs4WYsSW4x/1gbI4z/IyZ5wnmUmG+sT6ggP5nk6rmxAO
	5opVisY41Bx7bYY2bdvyBlsEL300=
X-Gm-Gg: ASbGncuJMl4wsnVmKNVwDebMus1iOByGvWS1abjT+yJ7QgOZ/39pJbfmB7aLhz/jA97
	9vO8SpOKvmdXsVd+gW9czgwT1JHSQ/u/zsP1tP5IdxJeCM+9kMkWp6qI/xrKkbvT+gzKPjc+3y+
	YRCfZfeRyi0o2jYMHV/ns6cMqrSYh9BxM6G8fsFXlxkxWSiSY6GFGWzevIpHu2
X-Google-Smtp-Source: AGHT+IHbVv/Ode4cj8HGRtAMtqqsIBTXZrNGpizjluj8SJxcP6Eq9kgPUWarAUv2CvIXKUZRCHLQlGHsY6247N7jGuo=
X-Received: by 2002:a05:6214:20a1:b0:6ea:d629:f47e with SMTP id
 6a1803df08f44-6eae7abac80mr4880766d6.33.1741884017937; Thu, 13 Mar 2025
 09:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250313073436.5133-1-f_l_k@t-online.de>
In-Reply-To: <20250313073436.5133-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Mar 2025 17:40:06 +0100
X-Gm-Features: AQ5f1Jrnne-Il6oLMan1WDSQnC8Hj2fb3nlp1AiNjgNjyZLeBKGN71h7UrvBnC4
Message-ID: <CANNYZj9BULvYRVdmg87Nf33f_up_XHhs_7OPwSGQ__T19XDC2w@mail.gmail.com>
Subject: Re: [RFC][gnome48][oe-core][PATCHv2 1/4] gtk4: update 4.16.2 -> 4.17.6
To: f_l_k@t-online.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 16:40:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212790

4.17.x are pre-releases, right? You should acknowledge this in the
commit message.

Alex

On Thu, 13 Mar 2025 at 08:34, Markus Volk via lists.openembedded.org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> Overview of Changes in 4.17.6, 04-03-2025
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Note: The buffer sizing fixes in this release are known to
> not work with fractional scales on macOS. This will hopefully
> be fixed soon. In the meantime, you can use the cairo renderer.
>
> * GSK rendering issues on Asahi Linux are fixed
>
> * Buffer sizing issues with fractional scaling are fixed
>
> * GtkFontChooser scrolls to the initially selected font
>
> * Font rendering with the new default GNOME font is improved
>
> * The Wayland cursor shape protocol is supported
>
> * Initial focus for popups on Android is fixed
>
> * Bugs fixed:
>   - #3184 Application crashes when presenting popover menus (Matthias Cla=
sen)
>   - #4019 Crash on ListBoxRow.get_index (Matthias Clasen)
>   - #6455 GtkFlowBox aligns incorrectly with GTK_ALIGN_END and
>     min/max_children_per_line (Gergo Koteles)
>   - #6817 Null pointer dereference in gdk_surface_request_motion (Matthia=
s
>     Clasen)
>   - #7146 GSK issues illegal render ops with load=3Ddont-care and blend=
=3Dover with
>     Wayland fractional scaling, causing graphical corruption (Benjamin Ot=
te)
>   - #7282 memorytexture testsuite fails the float tests (Benjamin Otte)
>   - #7314 Incorrect height calculations with fractional scaling under vul=
kan
>     renderer (violates vulkan validation layers) (Benjamin Otte)
>   - #7369 GtkTextView does not claim all click gestures (Maximiliano Sand=
oval)
>   - #7370 activating `GDK_DEBUG=3DEVENTS` crashes the application if a to=
uch event
>     occurs (Matthias Clasen)
>   - #7384 Comment required for search string (Matthias Clasen)
>   - !6617 Fix measuring label min wfh with wrap+ellipsize+lines
>   - !6635 gtkmodelbutton: Always close submenus when changing parent item
>   - !7746 ci: Regenerate Fedora image from F41
>   - !8028 fontchooser: scroll to selected font
>   - !8111 macos: Re-enable macOS GIR generation
>   - !8154 adjustment: Verify that values are finite
>   - !8156 Clarify hide-on-close documentation
>   - !8188 gdkkeys-win32: Add keymap get_active_layout_index/get_layout_na=
mes
>   - !8231 docs: Fix the missing image in the picture screenshots
>   - !8232 gdk: Fix spelling for GdkAndroidDisplayNightMode enum value nic=
k
>   - !8234 wayland: Update color coordinates for extra precision
>   - !8235 Drop GskProfiler
>   - !8241 macos: Do not occupy space for window buttons when full screen
>   - !8242 android: Update focus state on motion events for autohide surfa=
ces
>   - !8243 gdk: Deprecate gdk_cairo_context_cairo_create()
>   - !8246 cpdb: Update gtk_print_backend_cpdb_init for latest CPDB versio=
n
>   - !8247 wayland: Support the cursor-shape protocol
>   - !8248 docs: Fix an image name
>   - !8250 macos: Track number of button widgets realized on a window
>   - !8251 wayland: Go back to the old none cursor
>   - !8253 Bring back unhinted extents
>   - !8256 wayland: Fix none cursor check
>   - !8263 inspector: Show font options
>   - !8264 Try again to fix font rendering
>
> * Translation updates:
>   - Basque (Asier Sarasua Garmendia)
>   - Bulgarian (twlvnn kraftwerk, Alexander Shopov)
>   - Catalan (Jordi Mas i Hernandez)
>   - Chinese (China) (Luming Zh)
>   - Czech (Daniel Rusek)
>   - Finnish (Jiri Gr=C3=B6nroos)
>   - Galician (Fran Dieguez)
>   - Georgian (Ekaterine Papava)
>   - Hebrew (Yosef Or Boczko)
>   - Indonesian (Andika Triwidada)
>   - Korean (Changwoo Ryu)
>   - Lithuanian (Aurimas =C4=8Cernius)
>   - Persian (Danial Behzadi)
>   - Polish (Piotr Dr=C4=85g)
>   - Portuguese (Hugo Carvalho)
>   - Portuguese (Brazil) (Rafael Fontenelle)
>   - Slovenian (Martin)
>   - Spanish (Daniel Mustieles)
>   - Turkish (Sabri =C3=9Cnal)
>   - Ukrainian (Yuri Chornoivan)
>
> Overview of Changes in 4.17.5, 23-02-2025
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> * Numeric mode in GtkSpinButtons works again
>
> * Client-side dialogs can be made fully modal
>
> * Portals work better for unsandboxed apps, by registering
>
> * Editable labels have a context menu
>
> * GtkListBox size allocation has been improved
>
> * We require wayland 1.23 and wayland-protocols 1.41
>
> * We use the wp_color_manager_v1 protocol for color management under Wayl=
and
>
> * Most screenshots in the documentation have a dark variant
>
> * GtkBuilder allows inline definition for GMenu-valued properties
>
> * Headerbars can use native window controls on macOS
>
> * Bugs fixed:
>   - #4353 Keyboard: Set shortcut does not work for key-codes > 247 (Matth=
ias
>     Clasen)
>   - #5125 Demo / Menu: Popup at wrong position, hangs on Wayland (Matthia=
s
>     Clasen)
>   - #5815 builder: integrate menus more properly (Matthias Clasen)
>   - #6010 gtk4-demo > Lists > Selections emits CRITICALS (Matthias Clasen=
)
>   - #6272 a11y: API for updating platform state for custom GtkAccessible
>     implementations is missing (Emmanuele Bassi)
>   - #6355 gtk_widget_compute_transform() not working correctly with GtkPo=
pover
>     (Alessandro Astone)
>   - #6379 GtkListBox crashes if the placeholder is focused and then TAB i=
s
>     pressed
>   - #7191 Have a way to block parent shortcuts in AdwDialog (Matthias Cla=
sen)
>   - #7215 Changing the click behavior of Gtk.EditableLabel (Matthias Clas=
en)
>   - #7229 GSK/vulkan uses mipmaps without checking the formats/tiling
>     `VkImageFormatProperties.maxMipLevels` (Janne Grunau)
>   - #7249 Cursor hotspot and cursor image are not updated atomically on W=
ayland
>     (Carlos Garnacho)
>   - #7257 Unexpected spacing at the end of a textview when using child wi=
dgets.
>     (Sergey Bugaev)
>   - #7286 GtkApplicationWindow show-menubar documentation inconsistent
>   - #7307 GtkAppChooserWidget doesn't fit in a mobile screen (Automeris n=
aranja)
>   - #7310 Inspector showing child widgets & controllers twice (Florian
>     "sp1rit")
>   - #7311 GtkSpinButton:numeric=3DTrue doesn't work (Matthias Clasen)
>   - #7312 Dead link in common questions
>   - #7321 mem leak in emoji chooser (Matthias Clasen)
>   - #7322 invalid array index use
>   - #7324 Missing support for F17, F18, F19 and F20 keys on MacOS (Elisa =
Pau)
>   - #7334 Gtk password inputs should expose the displayed text (e.g. blac=
k
>     circles) via AT-SPI; not the underlying value (Emmanuele Bassi)
>   - #7340 Job Failed #4757144: Meson error
>   - !7951 ListBox hacking
>   - !8071 macos: Native window controls
>   - !8073 gpu: Fix off-by-one error in gsk_vulkan_mipmap_levels
>   - !8155 application: Register host apps with portal
>   - !8177 Small Android fixes
>   - !8178 Fix typo in `FileLauncher.set_always_ask` docs
>   - !8179 gdk/wayland: Use forgotten include guards
>   - !8180 docs: fix some typos, mainly closing ticks
>   - !8184 android: Provide Gdk.FOCUS_CHANGE events
>   - !8187 demos: Fix gettext domain in metainfo
>   - !8195 gtk-demo: Tweak the fixed demo
>   - !8196 settings: Fix GdkDisplay values ignored at init
>   - !8197 popovermenubar: Do not steal the focus on hover
>   - !8198 gi: Add missing annotation to WaylandSurface.force_next_commit
>   - !8200 rendernode: Add fixed-size annotations
>   - !8201 fontdialogbutton: Gracefully handle unknown font
>   - !8205 Update getting_started.md - point to Gtk.Widget.present instead=
 of
>     show
>   - !8206 docs: Fix 'Title overline too short' error
>   - !8207 Update getting_started for gdk_surface_create_similar_surface
>     depreaction
>   - !8208 a11y: Fix issues in text attribute run logic
>   - !8210 gdk: Small documentation improvements
>   - !8211 wayland: Use the wp_color_manager_v1 protocol
>   - !8217 macos: Disable animations if setting "Reduce Motion" is active
>   - !8219 application: Clean up dangling inhibitor surface
>   - !8221 gtk-demo: Improve colors of triangle in GLArea demo
>   - !8222 vulkan: Fix max amount of modifiers per format
>   - !8223 docs: Add dark variants to widget gallery
>   - !8224 docs: Fix gallery images for menus
>   - !8228 gsk: Don't color-convert empty surfaces
>   - !8229 gdk: Remove GDK_DEBUG=3Dgl-no-fractional
>
> * Translation updates:
>   - Catalan (Jordi Mas)
>   - Chinese (Taiwan) (Chao-Hsiung Liao)
>   - French (Vincent Chatelain)
>   - Georgian (Ekaterine Papava)
>   - Nepali (Pawan Chitrakar)
>   - Persian (Danial Behzadi)
>   - Polish (Piotr Dr=C4=85g)
>   - Slovenian (Martin)
>
> Overview of Changes in 4.17.4, 01-02-2025
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> This release introduces a new backend, which allows running
> GTK applications on Android phones. It is still considered
> experimental. Feedback and improvements are welcome!
>
> We have a ci job that produces signed apks for gtk4-demo,
> to make it easy to try this out.
>
> * GtkFileChooser:
>  - Stop replacing : (colon) with U+2236 (ratio)
>
> * GtkSpinButton:
>  - Avoid out-of-bounds values in some cases
>
> * GtkWindow:
>  - Send expected a11y events when a window is closed
>  - Change accessible role back to GTK_ACCESSIBLE_ROLE_WINDOW
>
> * GtkLabel:
>  - Make context menus keyboard-navigatable
>
> * GtkVideo:
>  - Support rotated videos
>
> * GDK:
>  - Add a way to retrieve keyboard layout information
>  - Use libpng api for cicp if available
>
> * GSK
>  - Drop the old GL renderer
>
> * Accessibility:
>  - Maintain inverse relations
>
> * macOS:
>  - Enable AccessKit in ci
>  - Fix inverted pen tilt
>
> * Deprecations:
>  - The x11 backend
>  - The Broadway backend
>
> * Build:
>  - Require cairo 1.18.2
>
> * Bugs fixed:
>   - #6755 Accessible `window:activate` events missing for Gtk4 (Matthias =
Clasen)
>   - #6823 Enumeration values starting with numbers (Matthias Clasen)
>   - #7210 ci: Build with -Daccesskit=3Denabled on macOS
>   - #7228 gtk4-demo settings demo does not actually write settings (Matth=
ias
>     Clasen)
>   - #7246 Cannot navigate context menu of GtkLabel with keyboard
>   - #7268 RFC: API to query the current keyboard layout ?
>   - #7271 Test failures with libpng-1.6.45 (Alessandro Astone)
>   - #7279 GTKFileChooserWidget incorrectly displays "Modified" time of fi=
le when
>     format should be "%H:%M" (Matthias Clasen)
>   - #7294 Hovering buttons causes "g_object_unref: assertion 'G_IS_OBJECT
>     (object)' failed" (Matthias Clasen)
>   - !7555 Introducing new android backend
>   - !8017 gdk: fix crash on Wayland with already destroyed surface.
>   - !8060 Deprecate the X11 backend
>   - !8115 Introduce the label for relation and the concept of reverse rel=
ations
>   - !8118 Prepare the 4.17.3 release
>   - !8119 Post-release version bump
>   - !8121 vulkan: Handle VK_PRESENT_MODE_FIFO_LATEST_READY_EXT
>   - !8124 Fix the archive URL for Boost
>   - !8126 docs: Mark GtkShortcutsWindow as deprecated
>   - !8127 tools: Drop support for the gl renderer
>   - !8128 spinbutton: Consider adjustment value sanitization
>   - !8129 Drop test exclusions for the gl renderer
>   - !8133 ci: Move subproject download and update over to a separate job
>   - !8134 Keep installing gsk/gl/gskglrenderer.h
>   - !8137 gtktextattributes and gtkaccessible copy-paste errors
>   - !8138 gtk-demo: Plug a memory leak
>   - !8139 window: Hide accessible earlier
>   - !8140 Keep installing gsk/gl/gskglrenderer.h
>   - !8142 gtk4-builder-tool: Plug a few memory leaks
>   - !8144 macos: fix broken accounting messages and click after moving th=
e
>     window
>   - !8147 Docs: Small fixes
>   - !8148 text: Correct the documentation
>   - !8150 Avoid using deprecated GtkWindow::keys-changed internally
>   - !8151 gstreamer: Implement rotation tag support
>   - !8157 gstreamer: Improve rotation tag support
>   - !8160 docs: Don't recommend usage of deprecated ToggleButton method
>   - !8163 gdk/contentserializer: Force specific URI schemes to serialize =
as URI
>   - !8164 gdk/wayland: Ensure to generate grab broken events before cross=
ings
>   - !8166 filedialog: fix typo in docs
>   - !8167 macos: Gtk4: Fix inverted pen Y tilt on macOS
>
> * Translation updates:
>   - Slovenian (Martin)
>   - Thai (Aefgh Threenine)
>
> Overview of Changes in 4.17.3, 16-01-2025
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> * GtkText:
>  - Consume Ctrl-A
>  - Handle Cut', Copy, Paste, Undo, and Redo keys
>  - Improve a11y representation
>
> * GtkLabel:
>  - Consume Ctrl-A when we handle it
>  - Pass mnemonics to a11y
>
> * GtkTextView:
>  - Handle Cut, Copy, Paste, Undo, and Redo keys
>  - Fix disappearing carets after focus changes
>
> * GtkFileChooser:
>  - Handle Find keys
>  - Set a11y label on Search button
>  - Set a11y labels on pathbar buttons
>  - Pass key-shortcuts for the "New folder" button
>
> * GtkAppChooser:
>  - Fix sorting
>
> * GtkListBox:
>  - Improve a11y representation
>
> * GtkColumnView:
>  - Fix column dnd in right-to-left context
>
> * GtkWindow:
>  - Make resize corners gapless with rounded corners
>
> * GtkPopoverMenu:
>  - Show mnemonics on Alt press
>
> * GtkMenuButton:
>  - Improve a11y representation
>
> * GtkFileDialog:
>  - Fix a crash
>  - Add more text file api variants
>
> * GtkSizeGroup:
>  - Improve consistency measurements and allocations
>
> * GtkBuilder:
>  - Parse tab arrays and font descriptions in Pango syntax
>
> * Wayland:
>  - Rely on scale events for pointer surfaces
>  - Make idle inhibit work with fullscreen subsurfaces
>
> * Accessibility:
>  - Implement GetKeyBinding properly for actions
>  - Set key-shortcuts attribute
>  - Fix state change notification for some states
>  - Set application ID attribute
>
> * MacOS:
>  - Make the NGL renderer work again
>
> * GSK:
>  - Don't double-clip edges for shadows
>
> * Demos:
>  - widget-factory: Set alternative text on pictures
>  - gtk-demo: Allow to run as a service
>
> * Deprecations:
>  - GtkShortcutsWindow
>  - Loading themes from ~/.themes
>  - <child> in ui files where child properties exist
>
> * Translation updates:
>  Brazilian Portuguese
>  Georgian
>  Turkish
>
> Overview of Changes in 4.17.2, 26-12-2024
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> * GtkWindow:
>  - Rework computing the minimum size
>
> * GtkPicture:
>  - Fix measuring with content-fit =3D scale-down
>
> * GtkStack:
>  - Report constant size request mode in more cases
>  - Avoid measuring children aginst preferred request mode
>  - Fix measuring during size interpolation
>
> * GtkFlowBox:
>  - Improve size request mode reporting
>  - Fix measuring minimum height
>  - Fix measuring natural width
>  - Implement hfw vai binary search
>
> * GtkScrolledWindow:
>  - Report constant size request mode in more cases
>  - Skip measuring children if we can
>
> * GtkBox:
>  - Don't always reserve height for baseline alignment
>  - Rework natural opposite size-for-size computation
>  - Add fast paths for some cases of measurement and allocation
>
> * GtkLayoutManager:
>  - Skip invisible children for request mode determination
>  - Prefer hfw, all things being equal
>
> * GtkColorPicker:
>  - Respect GDK_DEBUG=3Dno-portals
>
> * GtkEntry:
>  - Stop guessing text direction from keyboard layout
>  - Add a shortcut and context menu item to change text direction
>
> * GtkSpinButton:
>  - Make numeric spin buttons always LTR
>
> * GtkAboutDialog:
>  - Small UI improvements
>
> * Accessibility:
>  - Add an AccessKit backend. Use -Daccesskit=3Denabled to build it
>    and GTK_A11Y=3Daccesskit to use it
>
> * Windows:
>  - Drop the AeroSnap emulation
>
> * Wayland:
>  - Always clear exported surface IDs on finalize
>  - Use the correct display for imcontext
>
> * Vulkan:
>  - Make GdkVulkanContext work with Android armv7
>
> * Build:
>  - Require GLib 2.80
>  - Require harfbuzz 8.4
>  - Require pango 1.55
>  - Require C11
>
> * Translation update:
>  Russian
>
> Overview of Changes in 4.17.1, 06-12-2024
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> This release switches our portal support from opt-in to opt-out.
> We will use portals by default, unless you set GDK_DEBUG=3Dno-portals.
> And we will *always* use portals in flatpaks.
>
> * Text rendering:
>  - Make error underlines smaller
>
> * GtkText:
>  - Avoid selecting inserted Emoji
>
> * GtkPlacesView:
>  - Improve accessibility
>
> * GtkFileChooser:
>  - Fix a case where search was stealing focus
>
> * GtkEmojiChooser:
>  - Update to CLDR 46 / Unicode 16
>
> * Accessibility:
>  - Fix DBus signature of ChildrenChanged
>
> * GDK:
>  - Don't recycle threads too aggressively
>  - Add GDK_DISABLE=3Dthreads to disable threaded operations
>  - Improve parallelization for small tasks
>
> * GSK:
>  - Make occlusion checking more effective
>  - Clip luminosity when clipping colors (avoiding masking artifacts)
>  - Fix problems with dihedral transforms
>
> * Vulkan:
>  - Streamline Vulkan setup
>  - Fix blurry rendering at certain scale/size combinations
>
> * OpenGL:
>  - Conform to buffer offset alignment requirements
>
> * Windows:
>  - Fix pasting certain bitmaps
>
> * Documentation:
>  - Revise and modernize some docs
>
> * Debugging:
>  - Inspector: Show surfaces and renderers in the tree
>  - Inspector: Make the object tree resizable
>  - Inspector: Add a "Copy for gitlab" button
>
> * Translation updates
>  Icelandic
>  Serbian
>  Slovenian
>
> Overview of Changes in 4.17.0, 06-11-2024
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> * GtkScrolledWindow
>  - Fix criticals in size allocation code
>
> * GtkFileChooser
>  - Fix a crash in the portal code
>
> * GtkFontChoser
>  - Make the dialog more shrinkable
>
> * GtkPicture
>  - Avoid unnecessary resizes
>
> * GtkVideo
>  - Make dmabufs work without GL
>
> * GtkListBox:
>  - Add a tab-behavior property to influence keynav
>
> * GtkEmojiChooser:
>  - Fix problems with insertion and selection
>
> * GtkStringList:
>  - Add gtk_string_list_find
>
> * GtkApplication:
>  - Respect GDK_DEBUG=3Dno-portals
>  - Set default window icon from app ID
>
> * GtkTextView:
>  - Vertical and horizontal positioning of the textview is now quantized
>    to the nearest device pixel. This should improve the perceived smoothn=
ess
>    of scrolling with fractional scaling and font hinting.
>  - Incorrect re-use of cached styling was fixed
>  - Fix some missing CSS invalidation
>  - Handle charsets in clipboard datatypes
>
> * Printing:
>  - Avoid warnings for avahi errors
>  - Fix a segfault in the print dialog setup code
>
> * Accessibility:
>  - Always realize non-widget accessibles, to help webkit
>  - Fix list view selection implementation
>  - Handle NULL values in more places
>
> * Gstreamer:
>  - Make dmabufs works without GL
>
> * Gdk:
>  - Add OKLAB and OKLCH color states
>  - GL: Drop support for GLES 2 and GL < 3.3
>  - GL: Use the ngl dmabuf downloader instead of the GL downloader
>  - Vulkan: Drop the GDK_VULKAN_DEVICE env var. Use MESA_VK_DEVICE_SELECT =
instead
>  - Vulkan: Use the swapchain maintenance extension to release swap images
>  - Forbid opening displays before gtk_init()
>
> * Gsk:
>  - Many improvements to the dmabuf downloaders
>  - ngl: Avoid glBufferSubData for globals, speeding up llvmpipe
>  - Renderer selection will no longer consider the GL renderer
>  - Allow Vulkan software rendering as fallback
>  - Support gradient interpolation in different color states
>
> * Wayland:
>  - Improve settings portal handling
>  - Improve fallback for cursor themes
>  - Make cursor theme changes apply immediately
>  - Use a viewporter for cursor image scaling
>  - Improve cursor size handling
>  - Use the system bell protocol if available
>  - Fix possible deadlock with high-priority sources triggering roundtrips
>
> * Windows:
>  - Improve the backend code
>  - Fix some problems with WGL on NVidia
>  - Many testsuite fixes for Windows compatibility
>  - Make all pixbuf loaders builtin in the gdk-pixbuf subproject
>  - Add GDK_DISABLE=3Daerosnap to disable aerosnap
>  - Improve clipboard handling
>  - Fix behavior or gdk_display_open() on Windows
>  - Numerous papercut fixes
>  - Require Windows 10
>
> * Macos:
>  - Fix crashes when dragging libadwaita TabView tabs
>  - Require macOS 10.15
>
> * Tools and demos
>  - gtk4-demo: Make demos standalone
>  - gtk4-demo: Drop GL shader demos
>  - gtk4-demo: Improve scrolling benchmarks
>  - gtk4-builder-tool: Improve separator handling
>  - gtk4-image-tool: Better color state support
>
> * Build:
>  - Don't set GSK_RENDERER in our flatpaks
>  - Require meson 1.2
>
> * Translation updates
>  Belarusian
>  Brazilian Portuguese
>  British English
>  Galician
>  Lithuanian
>  Romanian
>  Slovenian
>  Swedish
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-gnome/gtk+/{gtk4_4.16.12.bb =3D> gtk4_4.17.6.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-gnome/gtk+/{gtk4_4.16.12.bb =3D> gtk4_4.17.6.bb} (98=
%)
>
> diff --git a/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb b/meta/recipes-gnome=
/gtk+/gtk4_4.17.6.bb
> similarity index 98%
> rename from meta/recipes-gnome/gtk+/gtk4_4.16.12.bb
> rename to meta/recipes-gnome/gtk+/gtk4_4.17.6.bb
> index d8d37a526d..9e3ac729ca 100644
> --- a/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb
> +++ b/meta/recipes-gnome/gtk+/gtk4_4.17.6.bb
> @@ -38,7 +38,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
>  UPSTREAM_CHECK_REGEX =3D "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.=
xz"
>
>  SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-$=
{PV}.tar.xz"
> -SRC_URI[sha256sum] =3D "ef31bdbd6f082c4401634a20c850b0050c9bf252ef1e0797=
64ee95a2a0c4c95a"
> +SRC_URI[sha256sum] =3D "dfae9ba1263f84afa83a494db2ed14c7392c67840b6730bf=
a26eb79fde1e13a1"
>
>  S =3D "${WORKDIR}/gtk-${PV}"
>
> --
> 2.48.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212742): https://lists.openembedded.org/g/openembedde=
d-core/message/212742
> Mute This Topic: https://lists.openembedded.org/mt/111675689/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

