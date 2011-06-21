Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZ46R-0006lR-Pm
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 18:47:04 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5LGhTeg013547
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 09:43:29 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 21 Jun 2011 09:43:29 -0700
Message-ID: <4E00CA30.7020302@windriver.com>
Date: Tue, 21 Jun 2011 11:43:28 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Directory permissions and ownership -- RFC
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
X-List-Received-Date: Tue, 21 Jun 2011 16:47:04 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

I've had the task to resolve the directory permissions and ownership issues.
From the original RFC I sent out, a lot has changed.

The way OE, opkg and deb packages are defined, there is no way to define what
package "owns" a directory.  There is an expectation that directory permissions,
owner and group are consistent between packages (and thus recipes).

I've worked though a number of the issues.  While I'm not posting the patches
yet for inclusion, I'd like some feed back on the two specific patches below.

Patch 1:

Adjust the umask to 022.  This resolves the problem of dynamically generated
directories (mkdir -p) and specific files (touch foo) having odd permissions.

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=mhatle/perms&id=d8470b6a8efdbba04cef5d4dc1ce12720fe83621

Patch 2:

The item adds a new step to the package.bbclass, fixup_perms.  The function that
is responsible for fixing directory and file permissions, owners and groups
during the packaging process. This will fix various issues where two packages
may create the same directory and end up with different permissions, owner
and/or group.

The issue being resolved is that if two packages conflict in their ownership of
a directory, the first installed into the rootfs sets the permissions. This
leads to a least potentially non-deterministic filesystems, at worst security
defects.

The function has a set of default values. We sanitize all of the system
directories, as defined in bitbake.conf as 0755, root, root. We also have
determined as series of documentation directories. These are sanitized as 0755,
root, root with the files they contain as 0644, root, root. The user can add
their own settings, or override the defaults by providing a
meta/files/fs-perms.txt file. The format of this file is described in the
default file.

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=mhatle/perms&id=eb76974fb73f2793e9d6191fb12d502fefc74c80


Any comments/feedback is appreciated.

--Mark


