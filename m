Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9BB626B19D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 10:55:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6IAt2sY023204
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 03:55:02 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 18 Jul 2013 03:55:01 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Jul 2013 18:54:59 +0800
Message-ID: <cover.1374140808.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] python: fix importing readline with probably escape sequence output
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
X-List-Received-Date: Thu, 18 Jul 2013 10:55:01 -0000
Content-Type: text/plain

While imports readline in python, if TERM in terminfo is available and 
it contains the variable 'km' and 'smm', the readline initialization will
output the value of 'smm' which is the escape sequence '\E[?1034h'.

'km' means the terminal has a meta key which is a special key on MIT keyboards,
'smm' means turn on the meta key if this terminal has one.

There are 4 solutions to fix this issue:

1) Preserving TERM and unsetting TERM, or setting TERM with a terminal
   without 'smm' (such as terminal 'dumb'). This is the most common 
   approach. But the effect is global even we don't import readline.
   https://bugzilla.redhat.com/show_bug.cgi?id=304181
   http://bugs.python.org/issue11390
   http://lists.gnu.org/archive/html/bug-readline/2013-06/msg00000.html

2) Modify readline.c in python, mandatory let readline use a term
   without 'smm' as terminal (such as 'dumb'), it is similar to the
   above solution, but it localizes the effect in readline. The reason
   why choose 'dumb' is GNU Readline library use 'dumb' as default term
   when TERM is unset.

3) Modify terminfo.src in ncurses, let terminfo database doesn't
   contian 'smm', but the number of terms we supported is limited.

4) Modify terminal.c and readline.c in GNU Readline library to explicitly
   disable meta key, or just comment out the outputting code.
   
This patch implements solution 2, I think it has the least side effect.

Thanks
Hongxu

The following changes since commit 3dee534f1e25109e0bdb681de0746c336f4b8840:

  lib/oeqa: fix dependecy check (2013-07-16 10:04:17 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-python-readlne
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-python-readlne

Hongxu Jia (1):
  python: fix importing readline with probably escape sequence output

 meta/recipes-devtools/python/python.inc            |  4 ++-
 ...e-explicitly-use-dumb-as-default-terminal.patch | 35 ++++++++++++++++++++++
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python/readline-explicitly-use-dumb-as-default-terminal.patch

-- 
1.8.1.2


