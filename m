X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Anuj Mittal" <anuj.mittal@intel.com>
Subject: [hardknott][PATCH 04/14] scripts/runqemu-ifdown: Don't treat the last iptables command as special
Date: Thu, 17 Feb 2022 22:18:13 +0800
Message-Id: <a94191274ae84dae7facc8d161f34270a42b304b.1645106980.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1645106980.git.anuj.mittal@intel.com>
References: <cover.1645106980.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Daniel Müller <muellerd@fb.com>

The runqemu-ifup script performs a bunch of setup steps that
runqemu-ifdown attempts to undo later on. While a bunch of said setup
operations are considered fatal should they fail, the iptables based NAT
setup notably is not.
The tear down procedure in runqemu-ifdown, however, has the iptables
based tear down as the last operation, with the status of it determining
the overall status of the script. Hence, if this step fails, the script
is considered a failure overall. That is arguably inconsistent: If the
NAT setup did not succeed, the tear down cannot succeed either.
To ensure similarity of the two paths, let's not treat the last iptables
tear down operation any special and allow it to fail the runqemu-ifdown
script, but just ignore failures.

Background: we have seen a NAT related setup problem on the ifup path
(which didn't cause script failure), but then saw an issue bubbled up
when this operation was meant to be undone on the ifdown path.

Signed-off-by: Daniel Müller <muellerd@fb.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0ebcfb034bcad81efef5f746f0aa0b69772901a0)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/runqemu-ifdown | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/runqemu-ifdown b/scripts/runqemu-ifdown
index a104c37bf8..e0eb5344c6 100755
--- a/scripts/runqemu-ifdown
+++ b/scripts/runqemu-ifdown
@@ -64,3 +64,4 @@ n=$[ (`echo $TAP | sed 's/tap//'` * 2) + 1 ]
 dest=$[ (`echo $TAP | sed 's/tap//'` * 2) + 2 ]
 $IPTABLES -D POSTROUTING -t nat -j MASQUERADE -s 192.168.7.$n/32
 $IPTABLES -D POSTROUTING -t nat -j MASQUERADE -s 192.168.7.$dest/32
+true
-- 
2.35.1

