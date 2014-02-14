Return-Path: <josua.mayer97@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 86E256D762
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 15:02:42 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id a15so5961144eae.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 07:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=n861Wf6m37RfrznPPbH9Ec07zgBshyr8lxOF+t7sAwA=;
	b=r5zHhgLjstiRjgx+Szx41fStd3ehXqIyAT/bphtgW3p1UxaMplICKRug7yl9BeSpxx
	S81O1BeCzkJOHK5iajjtL450Fo3Gi4QFOlBASu+ZPfjULbUzuMqqom21/E5QapFgKwp/
	W1BtGFW3vDQ7NgcX/HTJNZzaVQX4913GS3454F8kkcVHWcGMfj5zqB9m7sM5oVb4FkOi
	RTi3VhhDsXyERt55bRT+a2thonHqIznFOS4QQTezZCs7kCaoHXfpPkWlgmIu/dl7TvlE
	ich4Nc0Ej/ZcVlekFnB0R2NbuTfmmxaJGE96bJnWcpD80FCUt19zrilAv7E3HRzttEB5
	kOTw==
X-Received: by 10.15.45.194 with SMTP id b42mr42739eew.103.1392390162928;
	Fri, 14 Feb 2014 07:02:42 -0800 (PST)
Received: from linux-9174.triple-a.uni-kl.de (pD957B653.dip0.t-ipconnect.de.
	[217.87.182.83])
	by mx.google.com with ESMTPSA id m1sm20701764een.7.2014.02.14.07.02.40
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Feb 2014 07:02:41 -0800 (PST)
From: Josua Mayer <josua.mayer97@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Feb 2014 16:02:24 +0100
Message-Id: <1392390144-16540-1-git-send-email-josua.mayer97@gmail.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH] package.bbclass: do_split_packages should always return something.
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
X-List-Received-Date: Fri, 14 Feb 2014 15:02:42 -0000

So far, when do_split_packages is passed a non-existing folder, it will return nothing.
While building Mesa with PACKAGECONFIG="egl gles" for qemux86, do_package threw a nice exception on a line reading "pkgs += do_split_packages":
"Exception: TypeError: 'NoneType' object is not iterable"
I think a function should always return something, and in this specific case, returning an empty list should be right.
This patch simply fixes the return statement to do just that.

Signed-off-by: Josua Mayer <josua.mayer97@gmail.com>
---
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 042d74c..297d962 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -126,7 +126,7 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
     # If the root directory doesn't exist, don't error out later but silently do
     # no splitting.
     if not os.path.exists(dvar + root):
-        return
+        return []
 
     ml = d.getVar("MLPREFIX", True)
     if ml:
-- 
1.8.4.5


