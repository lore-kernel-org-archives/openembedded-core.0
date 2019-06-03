Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DDFBE6010D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 08:49:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x538nK0k003301
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Jun 2019 01:49:20 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 3 Jun 2019 01:49:20 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>, <alex.kanavin@gmail.com>
Date: Mon, 3 Jun 2019 01:49:20 -0700
Message-ID: <20190603084920.46967-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] lib/oe/reciputils.py: support character `+' in git pv
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
X-List-Received-Date: Mon, 03 Jun 2019 08:49:22 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

While pv contains char `+' (such as ncurses 6.1+20181013),
it was incorrectly converted to `6.1'

In this commit:
- Convert [^\+]* to .*?
  Support pv to contain char `+' and not greedy match
  (Such as ncurses 6.1+20181013)

- Add [^\+] to sfx match
  Support sfx contains extra chars between `+' and `git'
  (such as asciidoc "8.6.9+py3-gitAUTOINC+618f6e6f6b")

- Make sfx and rev greedy match

Run `devtool check-upgrade-status --all' in poky and compare results,
only one difference on ncurses version:
Without the commit:
INFO: ncurses                   6.1             6.1+20181013    Hongxu Jia <hongxu.jia@windriver.com> 7a97a7f937762ba342d5b2fd7cd090885a809835

With the commit:
INFO: ncurses                   6.1+20181013    MATCH           Hongxu Jia <hongxu.jia@windriver.com> 7a97a7f937762ba342d5b2fd7cd090885a809835

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/recipeutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 1e5b9a49f9..630ae967af 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -934,7 +934,7 @@ def get_recipe_pv_without_srcpv(pv, uri_type):
     sfx = ''
 
     if uri_type == 'git':
-        git_regex = re.compile(r"(?P<pfx>v?)(?P<ver>[^\+]*)((?P<sfx>\+(git)?r?(AUTOINC\+))(?P<rev>.*))?")
+        git_regex = re.compile(r"(?P<pfx>v?)(?P<ver>.*?)(?P<sfx>\+[^\+]*(git)?r?(AUTOINC\+))(?P<rev>.*)")
         m = git_regex.match(pv)
 
         if m:
-- 
2.21.0


