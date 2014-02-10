Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 58A486EC4F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2014 19:28:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1AJSRNj027913
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2014 11:28:28 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Mon, 10 Feb 2014 11:28:27 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Feb 2014 13:28:24 -0600
Message-ID: <cover.1392060196.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.5.3
MIME-Version: 1.0
Subject: [PATCH 0/2] useradd-staticids
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
X-List-Received-Date: Mon, 10 Feb 2014 19:28:27 -0000
Content-Type: text/plain

Someone found a bug with the code already, see the bug information below:

> I'm testing with our current recipes which creates a user has a uid 
> overridden in a configured passwd table file.
> 
> Snippet from somepkg.bb:
> USERADD_PACKAGES = "${PN}"
> USERADD_PARAM_${PN} = "--system -s /bin/sh --user-group somename"
> 
> It does not contain any GROUPADD_PARAM_${PN}.
> This build fails since when adding the user 'somename', the group 
> 'somename' can't be found. Activating some commented debugging in the 
> bbclass, you can see these printouts:
> 
> WARNING: Before: 'USERADD_PARAM_somepkg' - '--system -s /bin/sh 
> --user-group somename'
> WARNING: After:  'USERADD_PARAM_somepkg' - '--gid somename --system 
> --shell /bin/sh --uid XX somename'
> 
> What can be seen is that the uid is fetched from the static passwd-file 
> that is configured, however the --user-group flag is lost and no group 
> is created (GROUPADD_PARAM is set to "" (blank) in the 
> run.do_install.useradd_sysroot.<pid>).

As noted above the --user-group flag was being cleared, even in cases where
we did not have enough information to properly clear it.  Refactor the code
in this section of the class..  (The above was used to verify functionality.)

In addition, a second patch cleaned up the error checking and added an
easier way for a developer of this code to see what is happening during initial
parse.

The following changes since commit b5b4898cd409036161c62891e9618d9ab3f891f9:

  python-pycurl: upgrade to 7.19.3 (2014-02-08 21:03:27 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mhatle/uidgid
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mhatle/uidgid

Mark Hatle (2):
  useradd-staticids: Fix groupadd when --user-group is selected
  useradd-staticids: Adjust USERADD_ERROR_DYNAMIC condition and error
    message

 meta/classes/useradd-staticids.bbclass | 58 ++++++++++++++++++++--------------
 1 file changed, 35 insertions(+), 23 deletions(-)

-- 
1.8.5.3


