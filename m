Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 86F207DDEA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 10:59:55 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id v11so6476761wru.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 03:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=D2dqybQkUbbxalEarh3hUSmX1PbgxGzaJXYg028gdoE=;
	b=M1VmrS83hqyJNbfsJDcgk/cZ9GoDvuCyPJXXyr0HEAmKdZc4o+lgz40nkhudXhsEJ4
	M3k1nlfN+6U76l6PV7scy8mjKJBtIPbMES6fvUlS0lmheH95gZYG8ft5BHWfFZvbP3wA
	/x6g7jM3xvYaBxNsQMQ5Izcrw5eRoJ+ZeggBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=D2dqybQkUbbxalEarh3hUSmX1PbgxGzaJXYg028gdoE=;
	b=mOBaWlrDiUxwEjSeZOBCMjYZJSNXdykh2ChbrYPGENpZJ4TpXL3pfvmXGXGglw8/Gl
	4XOopnW7wdyM3JubwR8p9SZw74gsKk/sdPBMR/dAExGF1Kr+ZQIY/OE0txktbxiVDb8T
	7pkPtxLrQB/B7gyLd9+oCDPSLtRefP2gF4b2ntXrD8pvEnVKp3LAYHT6RNhK9DTY6cGE
	EfaoNymhBoZ3DaaaFwOSqfUe5hgA04ZlDH5XReexMQONDhmrMpwdpF0YhG8gXbpIGvm3
	brn4dKHSZwdrOYCqv3njVNdJcttuGb4SMbtMXh3N28V2yiyrzuyRQSJRBO8DpX3JA+Gu
	QTSw==
X-Gm-Message-State: APjAAAVjvc5ypet9SSrvjUMLUyECqy5pCoBnvuXzHDNhsgmw8kJqnp4O
	z4v10vOIFlC5bK//dcGQEoN16X47/RQ=
X-Google-Smtp-Source: APXvYqxsF5rMpZMybbpdDJxQK/M0/mkoqPoGbXWy3VjSZl+tfD51PG4B8bdC8YRdFnSDa3MtK1Ft4g==
X-Received: by 2002:adf:9f4e:: with SMTP id f14mr11522155wrg.42.1557313195795; 
	Wed, 08 May 2019 03:59:55 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p13sm2911053wmb.0.2019.05.08.03.59.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 03:59:55 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2019 11:59:47 +0100
Message-Id: <20190508105949.24942-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190508105949.24942-1-richard.purdie@linuxfoundation.org>
References: <20190508105949.24942-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/4] scripts/pybootchart: Port to python3
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
X-List-Received-Date: Wed, 08 May 2019 10:59:56 -0000
Content-Transfer-Encoding: 8bit

This updates the pybootchart code (used for viewing build timing profiles)
to use python3. The bulk of the changes are to use gi instead of pygtk, i.e.
port from gtk+2 to gtk+3.

The main change is to make the bootchart widget inherit gtk.Scrollable
and change the way the scrollbars are implemented to match the new method
upstream. The drawing code used cairo already so can remain unchanged,

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/pybootchartgui/pybootchartgui.py      |   2 +-
 scripts/pybootchartgui/pybootchartgui/draw.py |  14 +-
 scripts/pybootchartgui/pybootchartgui/gui.py  | 208 +++++++++---------
 .../pybootchartgui/pybootchartgui/parsing.py  |  12 +-
 4 files changed, 118 insertions(+), 118 deletions(-)

diff --git a/scripts/pybootchartgui/pybootchartgui.py b/scripts/pybootchartgui/pybootchartgui.py
index 7ce1a5be40d..1c4062b42c8 100755
--- a/scripts/pybootchartgui/pybootchartgui.py
+++ b/scripts/pybootchartgui/pybootchartgui.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 #
 #  This file is part of pybootchartgui.
 
diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index 019070a7db4..99b3caacc7f 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -19,6 +19,7 @@ import math
 import re
 import random
 import colorsys
+import functools
 from operator import itemgetter
 
 class RenderOptions:
@@ -449,7 +450,7 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
                             [(sample.time,
                               # Sum up used space of all volumes including the current one
                               # so that the graphs appear as stacked on top of each other.
-                              reduce(lambda x,y: x+y,
+                              functools.reduce(lambda x,y: x+y,
                                      [sample.records[volume] - min_used[volume]
                                       for volume in volumes[0:i]
                                       if volume in sample.records],
@@ -501,7 +502,7 @@ def render_processes_chart(ctx, options, trace, curr_y, w, h, sec_w):
              TASK_COLOR_SYSROOT, off_x+360, curr_y + 45, leg_s)
     draw_legend_box (ctx, "Package", \
              TASK_COLOR_PACKAGE, off_x+480, curr_y + 45, leg_s)
-    draw_legend_box (ctx, "Package Write",
+    draw_legend_box (ctx, "Package Write", \
              TASK_COLOR_PACKAGE_WRITE, off_x+600, curr_y + 45, leg_s)
 
     ctx.set_font_size(PROC_TEXT_FONT_SIZE)
@@ -518,13 +519,14 @@ def render_processes_chart(ctx, options, trace, curr_y, w, h, sec_w):
                     trace.processes[val][1] - s < options.app_options.mintime:
                 continue
             task = val.split(":")[1]
-            #print val
-            #print trace.processes[val][1]
-            #print s
+            #print(val)
+            #print(trace.processes[val][1])
+            #print(s)
+
             x = chart_rect[0] + (s - offset) * sec_w
             w = ((trace.processes[val][1] - s) * sec_w)
 
-            #print "proc at %s %s %s %s" % (x, y, w, proc_h)
+            #print("proc at %s %s %s %s" % (x, y, w, proc_h))
             col = None
             if task == "do_compile":
                 col = TASK_COLOR_COMPILE
diff --git a/scripts/pybootchartgui/pybootchartgui/gui.py b/scripts/pybootchartgui/pybootchartgui/gui.py
index 7fedd232df0..e1fe915563b 100644
--- a/scripts/pybootchartgui/pybootchartgui/gui.py
+++ b/scripts/pybootchartgui/pybootchartgui/gui.py
@@ -13,64 +13,83 @@
 #  You should have received a copy of the GNU General Public License
 #  along with pybootchartgui. If not, see <http://www.gnu.org/licenses/>.
 
-import gobject
-import gtk
-import gtk.gdk
-import gtk.keysyms
+import gi
+gi.require_version('Gtk', '3.0') 
+from gi.repository import Gtk as gtk
+from gi.repository import Gtk
+from gi.repository import Gdk
+from gi.repository import GObject as gobject
+from gi.repository import GObject
+
 from . import draw
 from .draw import RenderOptions
 
-class PyBootchartWidget(gtk.DrawingArea):
+class PyBootchartWidget(gtk.DrawingArea, gtk.Scrollable):
     __gsignals__ = {
-            'expose-event': 'override',
-            'clicked' : (gobject.SIGNAL_RUN_LAST, gobject.TYPE_NONE, (gobject.TYPE_STRING, gtk.gdk.Event)),
+            'clicked' : (gobject.SIGNAL_RUN_LAST, gobject.TYPE_NONE, (gobject.TYPE_STRING, Gdk.Event)),
             'position-changed' : (gobject.SIGNAL_RUN_LAST, gobject.TYPE_NONE, (gobject.TYPE_INT, gobject.TYPE_INT)),
             'set-scroll-adjustments' : (gobject.SIGNAL_RUN_LAST, gobject.TYPE_NONE, (gtk.Adjustment, gtk.Adjustment))
     }
 
+    hadjustment = GObject.property(type=Gtk.Adjustment,
+                                   default=Gtk.Adjustment(),
+                                   flags=GObject.PARAM_READWRITE)
+    hscroll_policy = GObject.property(type=Gtk.ScrollablePolicy,
+                                      default=Gtk.ScrollablePolicy.MINIMUM,
+                                      flags=GObject.PARAM_READWRITE)
+    vadjustment = GObject.property(type=Gtk.Adjustment,
+                                   default=Gtk.Adjustment(),
+                                   flags=GObject.PARAM_READWRITE)
+    vscroll_policy = GObject.property(type=Gtk.ScrollablePolicy,
+                                      default=Gtk.ScrollablePolicy.MINIMUM,
+                                      flags=GObject.PARAM_READWRITE)
+
     def __init__(self, trace, options, xscale):
         gtk.DrawingArea.__init__(self)
 
         self.trace = trace
         self.options = options
 
-        self.set_flags(gtk.CAN_FOCUS)
+        self.set_can_focus(True)
 
-        self.add_events(gtk.gdk.BUTTON_PRESS_MASK | gtk.gdk.BUTTON_RELEASE_MASK)
+        self.add_events(Gdk.EventMask.BUTTON_PRESS_MASK | Gdk.EventMask.BUTTON_RELEASE_MASK)
         self.connect("button-press-event", self.on_area_button_press)
         self.connect("button-release-event", self.on_area_button_release)
-        self.add_events(gtk.gdk.POINTER_MOTION_MASK | gtk.gdk.POINTER_MOTION_HINT_MASK | gtk.gdk.BUTTON_RELEASE_MASK)
+        self.add_events(Gdk.EventMask.POINTER_MOTION_MASK | Gdk.EventMask.POINTER_MOTION_HINT_MASK | Gdk.EventMask.BUTTON_RELEASE_MASK)
         self.connect("motion-notify-event", self.on_area_motion_notify)
         self.connect("scroll-event", self.on_area_scroll_event)
         self.connect('key-press-event', self.on_key_press_event)
 
-        self.connect('set-scroll-adjustments', self.on_set_scroll_adjustments)
         self.connect("size-allocate", self.on_allocation_size_changed)
         self.connect("position-changed", self.on_position_changed)
 
+        self.connect("draw", self.on_draw)
+
         self.zoom_ratio = 1.0
         self.xscale = xscale
         self.x, self.y = 0.0, 0.0
 
         self.chart_width, self.chart_height = draw.extents(self.options, self.xscale, self.trace)
-        self.hadj = None
-        self.vadj = None
-        self.hadj_changed_signal_id = None
-        self.vadj_changed_signal_id = None
-
-    def do_expose_event(self, event):
-        cr = self.window.cairo_create()
-
-        # set a clip region for the expose event
-        cr.rectangle(
-                event.area.x, event.area.y,
-                event.area.width, event.area.height
-        )
-        cr.clip()
-        self.draw(cr, self.get_allocation())
-        return False
-
-    def draw(self, cr, rect):
+        self.our_width, self.our_height = self.chart_width, self.chart_height
+
+        self.hadj = gtk.Adjustment(0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
+        self.vadj = gtk.Adjustment(0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
+        self.vadj.connect('value-changed', self.on_adjustments_changed)
+        self.hadj.connect('value-changed', self.on_adjustments_changed)
+
+    def bound_vals(self):
+        self.x = max(0, self.x)
+        self.y = max(0, self.y)
+        self.x = min(self.chart_width - self.our_width, self.x)
+        self.y = min(self.chart_height - self.our_height, self.y)
+
+    def on_draw(self, darea, cr):
+        # set a clip region
+        #cr.rectangle(
+        #        self.x, self.y,
+        #        self.chart_width, self.chart_height
+        #)
+        #cr.clip()
         cr.set_source_rgba(1.0, 1.0, 1.0, 1.0)
         cr.paint()
         cr.scale(self.zoom_ratio, self.zoom_ratio)
@@ -84,7 +103,7 @@ class PyBootchartWidget(gtk.DrawingArea):
 
     def zoom_image (self, zoom_ratio):
         self.zoom_ratio = zoom_ratio
-        self._set_scroll_adjustments (self.hadj, self.vadj)
+        self._set_scroll_adjustments()
         self.queue_draw()
 
     def zoom_to_rect (self, rect):
@@ -122,126 +141,101 @@ class PyBootchartWidget(gtk.DrawingArea):
     def show_toggled(self, button):
         self.options.app_options.show_all = button.get_property ('active')
         self.chart_width, self.chart_height = draw.extents(self.options, self.xscale, self.trace)
-        self._set_scroll_adjustments(self.hadj, self.vadj)
+        self._set_scroll_adjustments()
         self.queue_draw()
 
     POS_INCREMENT = 100
 
     def on_key_press_event(self, widget, event):
-        if event.keyval == gtk.keysyms.Left:
+        if event.keyval == Gdk.keyval_from_name("Left"):
             self.x -= self.POS_INCREMENT/self.zoom_ratio
-        elif event.keyval == gtk.keysyms.Right:
+        elif event.keyval == Gdk.keyval_from_name("Right"):
             self.x += self.POS_INCREMENT/self.zoom_ratio
-        elif event.keyval == gtk.keysyms.Up:
+        elif event.keyval == Gdk.keyval_from_name("Up"):
             self.y -= self.POS_INCREMENT/self.zoom_ratio
-        elif event.keyval == gtk.keysyms.Down:
+        elif event.keyval == Gdk.keyval_from_name("Down"):
             self.y += self.POS_INCREMENT/self.zoom_ratio
         else:
             return False
+        self.bound_vals()
         self.queue_draw()
         self.position_changed()
         return True
 
     def on_area_button_press(self, area, event):
         if event.button == 2 or event.button == 1:
-            area.window.set_cursor(gtk.gdk.Cursor(gtk.gdk.FLEUR))
+            window = self.get_window()
+            window.set_cursor(Gdk.Cursor(Gdk.CursorType.FLEUR))
             self.prevmousex = event.x
             self.prevmousey = event.y
-        if event.type not in (gtk.gdk.BUTTON_PRESS, gtk.gdk.BUTTON_RELEASE):
+        if event.type not in (Gdk.EventType.BUTTON_PRESS, Gdk.EventType.BUTTON_RELEASE):
             return False
         return False
 
     def on_area_button_release(self, area, event):
         if event.button == 2 or event.button == 1:
-            area.window.set_cursor(gtk.gdk.Cursor(gtk.gdk.ARROW))
+            window = self.get_window()
+            window.set_cursor(Gdk.Cursor(Gdk.CursorType.ARROW))
             self.prevmousex = None
             self.prevmousey = None
             return True
         return False
 
     def on_area_scroll_event(self, area, event):
-        if event.state & gtk.gdk.CONTROL_MASK:
-            if event.direction == gtk.gdk.SCROLL_UP:
+        if event.state & Gdk.CONTROL_MASK:
+            if event.direction == Gdk.SCROLL_UP:
                 self.zoom_image(self.zoom_ratio * self.ZOOM_INCREMENT)
                 return True
-            if event.direction == gtk.gdk.SCROLL_DOWN:
+            if event.direction == Gdk.SCROLL_DOWN:
                 self.zoom_image(self.zoom_ratio / self.ZOOM_INCREMENT)
                 return True
             return False
 
     def on_area_motion_notify(self, area, event):
         state = event.state
-        if state & gtk.gdk.BUTTON2_MASK or state & gtk.gdk.BUTTON1_MASK:
+        if state & Gdk.ModifierType.BUTTON2_MASK or state & Gdk.ModifierType.BUTTON1_MASK:
             x, y = int(event.x), int(event.y)
             # pan the image
             self.x += (self.prevmousex - x)/self.zoom_ratio
             self.y += (self.prevmousey - y)/self.zoom_ratio
+            self.bound_vals()
             self.queue_draw()
             self.prevmousex = x
             self.prevmousey = y
             self.position_changed()
         return True
 
-    def on_set_scroll_adjustments(self, area, hadj, vadj):
-        self._set_scroll_adjustments (hadj, vadj)
-
     def on_allocation_size_changed(self, widget, allocation):
         self.hadj.page_size = allocation.width
         self.hadj.page_increment = allocation.width * 0.9
         self.vadj.page_size = allocation.height
         self.vadj.page_increment = allocation.height * 0.9
+        self.our_width = allocation.width
+        if self.chart_width < self.our_width:
+            self.our_width = self.chart_width
+        self.our_height = allocation.height
+        if self.chart_height < self.our_height:
+            self.our_height = self.chart_height
+        self._set_scroll_adjustments()
 
     def _set_adj_upper(self, adj, upper):
-        changed = False
-        value_changed = False
-
-        if adj.upper != upper:
-            adj.upper = upper
-            changed = True
-
-        max_value = max(0.0, upper - adj.page_size)
-        if adj.value > max_value:
-            adj.value = max_value
-            value_changed = True
-
-        if changed:
-            adj.changed()
-        if value_changed:
-            adj.value_changed()
-
-    def _set_scroll_adjustments(self, hadj, vadj):
-        if hadj == None:
-            hadj = gtk.Adjustment(0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
-        if vadj == None:
-            vadj = gtk.Adjustment(0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
-
-        if self.hadj_changed_signal_id != None and \
-           self.hadj != None and hadj != self.hadj:
-            self.hadj.disconnect (self.hadj_changed_signal_id)
-        if self.vadj_changed_signal_id != None and \
-           self.vadj != None and vadj != self.vadj:
-            self.vadj.disconnect (self.vadj_changed_signal_id)
-
-        if hadj != None:
-            self.hadj = hadj
-            self._set_adj_upper (self.hadj, self.zoom_ratio * self.chart_width)
-            self.hadj_changed_signal_id = self.hadj.connect('value-changed', self.on_adjustments_changed)
-
-        if vadj != None:
-            self.vadj = vadj
-            self._set_adj_upper (self.vadj, self.zoom_ratio * self.chart_height)
-            self.vadj_changed_signal_id = self.vadj.connect('value-changed', self.on_adjustments_changed)
+
+        if adj.get_upper() != upper:
+            adj.set_upper(upper)
+
+    def _set_scroll_adjustments(self):
+        self._set_adj_upper (self.hadj, self.zoom_ratio * (self.chart_width - self.our_width))
+        self._set_adj_upper (self.vadj, self.zoom_ratio * (self.chart_height - self.our_height))
 
     def on_adjustments_changed(self, adj):
-        self.x = self.hadj.value / self.zoom_ratio
-        self.y = self.vadj.value / self.zoom_ratio
+        self.x = self.hadj.get_value() / self.zoom_ratio
+        self.y = self.vadj.get_value() / self.zoom_ratio
         self.queue_draw()
 
     def on_position_changed(self, widget, x, y):
-        self.hadj.value = x * self.zoom_ratio
-        self.vadj.value = y * self.zoom_ratio
-
-PyBootchartWidget.set_set_scroll_adjustments_signal('set-scroll-adjustments')
+        self.hadj.set_value(x * self.zoom_ratio)
+        #self.hadj.value_changed()
+        self.vadj.set_value(y * self.zoom_ratio)
 
 class PyBootchartShell(gtk.VBox):
     ui = '''
@@ -260,7 +254,7 @@ class PyBootchartShell(gtk.VBox):
     def __init__(self, window, trace, options, xscale):
         gtk.VBox.__init__(self)
 
-        self.widget = PyBootchartWidget(trace, options, xscale)
+        self.widget2 = PyBootchartWidget(trace, options, xscale)
 
         # Create a UIManager instance
         uimanager = self.uimanager = gtk.UIManager()
@@ -275,12 +269,12 @@ class PyBootchartShell(gtk.VBox):
 
         # Create actions
         actiongroup.add_actions((
-                ('Expand', gtk.STOCK_ADD, None, None, None, self.widget.on_expand),
-                ('Contract', gtk.STOCK_REMOVE, None, None, None, self.widget.on_contract),
-                ('ZoomIn', gtk.STOCK_ZOOM_IN, None, None, None, self.widget.on_zoom_in),
-                ('ZoomOut', gtk.STOCK_ZOOM_OUT, None, None, None, self.widget.on_zoom_out),
-                ('ZoomFit', gtk.STOCK_ZOOM_FIT, 'Fit Width', None, None, self.widget.on_zoom_fit),
-                ('Zoom100', gtk.STOCK_ZOOM_100, None, None, None, self.widget.on_zoom_100),
+                ('Expand', gtk.STOCK_ADD, None, None, None, self.widget2.on_expand),
+                ('Contract', gtk.STOCK_REMOVE, None, None, None, self.widget2.on_contract),
+                ('ZoomIn', gtk.STOCK_ZOOM_IN, None, None, None, self.widget2.on_zoom_in),
+                ('ZoomOut', gtk.STOCK_ZOOM_OUT, None, None, None, self.widget2.on_zoom_out),
+                ('ZoomFit', gtk.STOCK_ZOOM_FIT, 'Fit Width', None, None, self.widget2.on_zoom_fit),
+                ('Zoom100', gtk.STOCK_ZOOM_100, None, None, None, self.widget2.on_zoom_100),
         ))
 
         # Add the actiongroup to the uimanager
@@ -290,29 +284,33 @@ class PyBootchartShell(gtk.VBox):
         uimanager.add_ui_from_string(self.ui)
 
         # Scrolled window
-        scrolled = gtk.ScrolledWindow()
-        scrolled.add(self.widget)
+        scrolled = gtk.ScrolledWindow(self.widget2.hadj, self.widget2.vadj)
+        scrolled.add(self.widget2)
+
+        #scrolled.set_hadjustment()
+        #scrolled.set_vadjustment(self.widget2.vadj)
+        scrolled.set_policy(gtk.PolicyType.ALWAYS, gtk.PolicyType.ALWAYS)
 
         # toolbar / h-box
         hbox = gtk.HBox(False, 8)
 
         # Create a Toolbar
         toolbar = uimanager.get_widget('/ToolBar')
-        hbox.pack_start(toolbar, True, True)
+        hbox.pack_start(toolbar, True, True, 0)
 
         if not options.kernel_only:
             # Misc. options
             button = gtk.CheckButton("Show more")
-            button.connect ('toggled', self.widget.show_toggled)
+            button.connect ('toggled', self.widget2.show_toggled)
             button.set_active(options.app_options.show_all)
-            hbox.pack_start (button, False, True)
+            hbox.pack_start (button, False, True, 0)
 
-        self.pack_start(hbox, False)
-        self.pack_start(scrolled)
+        self.pack_start(hbox, False, True, 0)
+        self.pack_start(scrolled, True, True, 0)
         self.show_all()
 
     def grab_focus(self, window):
-        window.set_focus(self.widget)
+        window.set_focus(self.widget2)
 
 
 class PyBootchartWindow(gtk.Window):
diff --git a/scripts/pybootchartgui/pybootchartgui/parsing.py b/scripts/pybootchartgui/pybootchartgui/parsing.py
index bcfb2da5698..ef2d3d309ca 100644
--- a/scripts/pybootchartgui/pybootchartgui/parsing.py
+++ b/scripts/pybootchartgui/pybootchartgui/parsing.py
@@ -267,7 +267,7 @@ def _parse_headers(file):
             value = line.strip()
         headers[last] += value
         return headers, last
-    return reduce(parse, file.read().decode('utf-8').split('\n'), (defaultdict(str),''))[0]
+    return reduce(parse, file.read().split('\n'), (defaultdict(str),''))[0]
 
 def _parse_timed_blocks(file):
     """Parses (ie., splits) a file into so-called timed-blocks. A
@@ -281,7 +281,7 @@ def _parse_timed_blocks(file):
             return (int(lines[0]), lines[1:])
         except ValueError:
             raise ParseError("expected a timed-block, but timestamp '%s' is not an integer" % lines[0])
-    blocks = file.read().decode('utf-8').split('\n\n')
+    blocks = file.read().split('\n\n')
     return [parse(block) for block in blocks if block.strip() and not block.endswith(' not running\n')]
 
 def _parse_proc_ps_log(writer, file):
@@ -577,7 +577,7 @@ def _parse_dmesg(writer, file):
     processMap['k-boot'] = kernel
     base_ts = False
     max_ts = 0
-    for line in file.read().decode('utf-8').split('\n'):
+    for line in file.read().split('\n'):
         t = timestamp_re.match (line)
         if t is None:
 #                       print "duff timestamp " + line
@@ -665,7 +665,7 @@ def _parse_pacct(writer, file):
 def _parse_paternity_log(writer, file):
     parent_map = {}
     parent_map[0] = 0
-    for line in file.read().decode('utf-8').split('\n'):
+    for line in file.read().split('\n'):
         if not line:
             continue
         elems = line.split(' ') # <Child> <Parent>
@@ -678,7 +678,7 @@ def _parse_paternity_log(writer, file):
 
 def _parse_cmdline_log(writer, file):
     cmdLines = {}
-    for block in file.read().decode('utf-8').split('\n\n'):
+    for block in file.read().split('\n\n'):
         lines = block.split('\n')
         if len (lines) >= 3:
 #                       print "Lines '%s'" % (lines[0])
@@ -751,7 +751,7 @@ def parse_file(writer, state, filename):
     if state.filename is None:
         state.filename = filename
     basename = os.path.basename(filename)
-    with open(filename, "rb") as file:
+    with open(filename, "r") as file:
         return _do_parse(writer, state, filename, file)
 
 def parse_paths(writer, state, paths):
-- 
2.20.1


