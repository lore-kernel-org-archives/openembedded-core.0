Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.18264.1600957558645164714
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2020 07:25:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F9591396
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2020 07:25:57 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DEE553F718
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2020 07:25:56 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] taskexp: update for GTK API changes
Date: Thu, 24 Sep 2020 15:25:53 +0100
Message-Id: <20200924142553.3654921-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The introspected API for GtkTreeModel and friends had some unexpected
quirks which have now been fixed, see[1] for details. However, for
example Ubuntu 20.04 has the fixed GTK but not an updated pygobject which
means taskexp raises an exception on startup.

Solve by manually looking at what functions are present and calling the
right one.

[ YOCTO #14055 ]

[1] https://gitlab.gnome.org/GNOME/pygobject/-/commit/9cdbc56fbac4db2de78=
dc080934b8f0a7efc892a

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 bitbake/lib/bb/ui/taskexp.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/ui/taskexp.py b/bitbake/lib/bb/ui/taskexp.py
index 05e32338c2..2b246710ca 100644
--- a/bitbake/lib/bb/ui/taskexp.py
+++ b/bitbake/lib/bb/ui/taskexp.py
@@ -58,7 +58,12 @@ class PackageReverseDepView(Gtk.TreeView):
         self.current =3D None
         self.filter_model =3D model.filter_new()
         self.filter_model.set_visible_func(self._filter)
-        self.sort_model =3D self.filter_model.sort_new_with_model()
+        # The introspected API was fixed but we can't rely on a pygobjec=
t that hides this.
+        # https://gitlab.gnome.org/GNOME/pygobject/-/commit/9cdbc56fbac4=
db2de78dc080934b8f0a7efc892a
+        if hasattr(Gtk.TreeModelSort, "new_with_model"):
+            self.sort_model =3D Gtk.TreeModelSort.new_with_model(self.fi=
lter_model)
+        else:
+            self.sort_model =3D self.filter_model.sort_new_with_model()
         self.sort_model.set_sort_column_id(COL_DEP_PARENT, Gtk.SortType.=
ASCENDING)
         self.set_model(self.sort_model)
         self.append_column(Gtk.TreeViewColumn(label, Gtk.CellRendererTex=
t(), text=3DCOL_DEP_PARENT))
--=20
2.25.1

