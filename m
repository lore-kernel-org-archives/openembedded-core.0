Received: from [74.127.214.27] (helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bengardiner@localhost>) id 1Q59lh-0007mi-Et
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Mar 2011 06:46:02 +0200
Received: by localhost (Postfix, from userid 1001)
	id 2F528D402E; Thu, 31 Mar 2011 00:36:38 -0400 (EDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Date: Thu, 31 Mar 2011 00:36:35 -0400
Message-Id: <cover.1301544780.git.bengardiner@nanometrics.ca> 
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <a5c403f0fc71f38c0669691da7f637303ea09a27.1300978024.git.richard.purdie@linuxfoundation.org>
References: <a5c403f0fc71f38c0669691da7f637303ea09a27.1300978024.git.richard.purdie@linuxfoundation.org>
Cc: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Subject: [PATCH 0/3] port oe-dev ,ubifs.img link support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Mar 2011 04:46:02 -0000

I made some changes in oe-dev to normalize the link names used for the 
ubifs images created when the type is ubifs vs. when the type is UBI. 
The changes we two-fold: make symlinks to either .rootfs.<type> or 
<type>.img and use the <type>.img extension for the ubifs images when 
they are intermediate for UBI image generation as well as the final 
target.

The changes were accepted by Tom Rini for oe-dev and Denys Dmytriyenko 
for arago.

I've only just begun following the oe-core list and I noticed your 
(Richard's) changes to introduce image_type.bbclass to oe-core. When I 
looked closer at the changes I could see that there had been no sync-up 
from oe-dev to oe-core since the changes I mentioned above.

This changeset should align oe-core with those recent changes in oe-dev; 
the changes I made were dependent on Bernhard's change to replace the 
symlink target with 'ln -f' instead of 'rm'ing it first; so I ported his 
commit also.

I'm sorry to say that there has been no testing of these changes with 
oe-core. I would be interested in trying a test build... but I must admit
I don't know what MACHINE+DISTRO+image to try as a simple test build.

Ben Gardiner (2):
  image_types.bbclass: add link to .rootfs.<type> or .<type>.img
  image_types.bbclass: use .ubifs.img extension in IMAGE_CMD_ubi

Bernhard Reutner-Fischer (1):
  image_types.bbclass: rm symlink destination via ln

 meta/classes/image_types.bbclass | 11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)



