Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id C437276FDE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 23:08:10 +0000 (UTC)
Received: by qgez77 with SMTP id z77so96999101qge.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Sep 2015 16:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=C6RJXFgSi2oWx2Ku4biamDYrMl19pno9Sr53K5MpqSo=;
	b=uNCDb+NPhkaXsxsOolh8KE48gZ0mVXtHhgrauDhmyc8YsNa/+gSvofFCcwEt55S4TB
	aaKcON3/dZAq14vG7wDm/BLfQoEfv9O0drK5AiE0bP8/T8thIV7Yekz9IicBbYk4texc
	W4FiRXrg3NwMoDiK2JQf+qbFpidj7IjsuSMP1JZyP8cQUBxVts9I/eubeyzbL0SIEYfG
	Mxuas1O4vnfpntVa+CqRzK0Sjwp5UpzAoercPKNeboITZsl8cb3AKACAmPNd/M3Pdr+p
	sDSM7J5r83aOFUqP5karnKj0s3L1sSgeiY+SIZlgIVR0zZ/gMNQu1iEVgtdXNEtW8OPj
	Nx2A==
X-Received: by 10.140.232.150 with SMTP id d144mr38200241qhc.17.1441753690574; 
	Tue, 08 Sep 2015 16:08:10 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	h66sm2784934qkh.28.2015.09.08.16.08.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Sep 2015 16:08:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 23:07:54 +0000
Message-Id: <b4be4eb148b3551893639ac087be2d4e8dcb8eb5.1441753511.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <762ad7bc4268386c2a29ea6c23bc8094fd52d160.1441753511.git.raj.khem@gmail.com>
References: <762ad7bc4268386c2a29ea6c23bc8094fd52d160.1441753511.git.raj.khem@gmail.com>
In-Reply-To: <cover.1441753511.git.raj.khem@gmail.com>
References: <cover.1441753511.git.raj.khem@gmail.com>
Subject: [PATCH 14/16] webkit-gtk: Backport fix to remove FrameDestructionObserver
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
X-List-Received-Date: Tue, 08 Sep 2015 23:08:11 -0000

This helps clang compile webkit without problems. This is a backport
from upstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ride-of-FrameDestructionObserver-willDeta.patch | 105 +++++++++++++++++++++
 meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb       |   1 +
 2 files changed, 106 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkit-gtk-1.8.3/0001-Remove-override-of-FrameDestructionObserver-willDeta.patch

diff --git a/meta/recipes-sato/webkit/webkit-gtk-1.8.3/0001-Remove-override-of-FrameDestructionObserver-willDeta.patch b/meta/recipes-sato/webkit/webkit-gtk-1.8.3/0001-Remove-override-of-FrameDestructionObserver-willDeta.patch
new file mode 100644
index 0000000..c8761d8
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkit-gtk-1.8.3/0001-Remove-override-of-FrameDestructionObserver-willDeta.patch
@@ -0,0 +1,105 @@
+From 540a792c05f0c7800f694eb39a04d8c31b685789 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 7 Sep 2015 16:36:02 +0000
+Subject: [PATCH] Remove override of FrameDestructionObserver::willDetachPage()
+
+Reviewed by Antti Koivisto.
+This callback was only used by the Chromium port.
+editing/Editor.h:
+editing/Editor.cpp:
+Remove override of FrameDestructionObserver::willDetachPage().
+page/EditorClient.h:
+Remove frameWillDetachPage(). This is repeated in every EditorClient subclass.
+
+Backported from https://bugs.webkit.org/show_bug.cgi?id=119950
+
+Upstream-Status: Backport
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Source/WebCore/editing/Editor.cpp                          | 6 ------
+ Source/WebCore/editing/Editor.h                            | 1 -
+ Source/WebCore/loader/EmptyClients.h                       | 1 -
+ Source/WebCore/page/EditorClient.h                         | 1 -
+ Source/WebKit/gtk/WebCoreSupport/EditorClientGtk.h         | 1 -
+ Source/WebKit2/WebProcess/WebCoreSupport/WebEditorClient.h | 1 -
+ 6 files changed, 11 deletions(-)
+
+diff --git a/Source/WebCore/editing/Editor.cpp b/Source/WebCore/editing/Editor.cpp
+index 45c5612..2af4057 100644
+--- a/Source/WebCore/editing/Editor.cpp
++++ b/Source/WebCore/editing/Editor.cpp
+@@ -3020,10 +3020,4 @@ bool Editor::unifiedTextCheckerEnabled() const
+     return WebCore::unifiedTextCheckerEnabled(m_frame);
+ }
+ 
+-void Editor::willDetachPage()
+-{
+-    if (EditorClient* editorClient = client())
+-        editorClient->frameWillDetachPage(frame());
+-}
+-
+ } // namespace WebCore
+diff --git a/Source/WebCore/editing/Editor.h b/Source/WebCore/editing/Editor.h
+index 32fc3dc..0c8cc40 100644
+--- a/Source/WebCore/editing/Editor.h
++++ b/Source/WebCore/editing/Editor.h
+@@ -385,7 +385,6 @@ public:
+     void deviceScaleFactorChanged();
+ 
+ private:
+-    virtual void willDetachPage() OVERRIDE;
+ 
+     OwnPtr<DeleteButtonController> m_deleteButtonController;
+     RefPtr<CompositeEditCommand> m_lastEditCommand;
+diff --git a/Source/WebCore/loader/EmptyClients.h b/Source/WebCore/loader/EmptyClients.h
+index 76e6642..7525a42 100644
+--- a/Source/WebCore/loader/EmptyClients.h
++++ b/Source/WebCore/loader/EmptyClients.h
+@@ -439,7 +439,6 @@ public:
+     EmptyEditorClient() { }
+     virtual ~EmptyEditorClient() { }
+     virtual void pageDestroyed() { }
+-    virtual void frameWillDetachPage(Frame*) { }
+ 
+     virtual bool shouldDeleteRange(Range*) { return false; }
+     virtual bool shouldShowDeleteInterface(HTMLElement*) { return false; }
+diff --git a/Source/WebCore/page/EditorClient.h b/Source/WebCore/page/EditorClient.h
+index f8a2106..451bbd4 100644
+--- a/Source/WebCore/page/EditorClient.h
++++ b/Source/WebCore/page/EditorClient.h
+@@ -65,7 +65,6 @@ class EditorClient {
+ public:
+     virtual ~EditorClient() {  }
+     virtual void pageDestroyed() = 0;
+-    virtual void frameWillDetachPage(Frame*) = 0;
+ 
+     virtual bool shouldDeleteRange(Range*) = 0;
+     virtual bool shouldShowDeleteInterface(HTMLElement*) = 0;
+diff --git a/Source/WebKit/gtk/WebCoreSupport/EditorClientGtk.h b/Source/WebKit/gtk/WebCoreSupport/EditorClientGtk.h
+index 0ff9278..2533c16 100644
+--- a/Source/WebKit/gtk/WebCoreSupport/EditorClientGtk.h
++++ b/Source/WebKit/gtk/WebCoreSupport/EditorClientGtk.h
+@@ -76,7 +76,6 @@ class EditorClient : public WebCore::EditorClient {
+ 
+         // from EditorClient
+         virtual void pageDestroyed();
+-        virtual void frameWillDetachPage(WebCore::Frame*) { }
+ 
+         virtual bool shouldDeleteRange(WebCore::Range*);
+         virtual bool shouldShowDeleteInterface(WebCore::HTMLElement*);
+diff --git a/Source/WebKit2/WebProcess/WebCoreSupport/WebEditorClient.h b/Source/WebKit2/WebProcess/WebCoreSupport/WebEditorClient.h
+index 20818ff..b82d1ef 100644
+--- a/Source/WebKit2/WebProcess/WebCoreSupport/WebEditorClient.h
++++ b/Source/WebKit2/WebProcess/WebCoreSupport/WebEditorClient.h
+@@ -42,7 +42,6 @@ public:
+ 
+ private:
+     virtual void pageDestroyed() OVERRIDE;
+-    virtual void frameWillDetachPage(WebCore::Frame*) OVERRIDE { }
+ 
+     virtual bool shouldDeleteRange(WebCore::Range*) OVERRIDE;
+     virtual bool shouldShowDeleteInterface(WebCore::HTMLElement*) OVERRIDE;
+-- 
+2.5.1
+
diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
index b9a9d7a..7142dd3 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
@@ -30,6 +30,7 @@ SRC_URI = "\
   file://0001-Enable-mips64-build.patch \
   file://aarch64.patch \
   file://webkit-gtk-ANGLE-doesn-t-build-with-bison-3.patch \
+  file://0001-Remove-override-of-FrameDestructionObserver-willDeta.patch \
  "
 
 SRC_URI[md5sum] = "dcbf9d5e2e6391f857c29a57528b32a6"
-- 
2.5.1


