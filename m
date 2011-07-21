Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjwhY-0002o1-FJ
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 19:06:20 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Jul 2011 10:02:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,242,1309762800"; d="scan'208";a="33054987"
Received: from unknown (HELO [10.255.13.254]) ([10.255.13.254])
	by fmsmga001.fm.intel.com with ESMTP; 21 Jul 2011 10:02:11 -0700
Message-ID: <4E285B8E.4070502@linux.intel.com>
Date: Thu, 21 Jul 2011 10:02:06 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1311234759.git.kai.kang@windriver.com>
In-Reply-To: <cover.1311234759.git.kai.kang@windriver.com>
Subject: Re: [PATCH 00/10] works of adding packages pam support
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
X-List-Received-Date: Thu, 21 Jul 2011 17:06:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/21/2011 01:00 AM, Kang Kai wrote:
> From: Kang Kai<kai.kang@windriver.com>
>
> Hi Scott,
>
> This is the current work of adding pam supports.
>
> After update libpam to 1.1.4, we enable the packages pam support. And if the pacakge
> doesn't have a pam configure file, import from Fedora.
>
Kai,

Thanks for this work, you have already gotten some feedback, I have a 
few general comments to add that are across many of these patches, so I 
will note them here.

Whitespace: you seem to be using tabs instead of spaces, please check 
that you have spaces and your items are lined up. Yocto uses 4 spaces 
for python and bb recipes and tabs for shell scripts and shell functions 
in bb recipes.

As has already been noted in a couple of places, ensure that you only 
install things pam specific when the pam DISTRO_FEATURE is enabled, 
there are multiple places that need this (not just the ones already noted).

Worth noting here also make sure you check all your PR bumps are correct.

Commit messages and comments for things to oe-core should talk about 
oe-core not yocto or poky as this upsets people ;-)

I am going to hold of on taking this series until you fix it up.

Sau!



> The following changes since commit fa4bcfdb73167f8159b88e5a4d711c0d37627a70:
>
>    bb-matrix: correct BB and PM number canonicalization (2011-07-14 22:23:09 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib kangkai/distro
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/pam-commits
>
> Kang Kai (5):
>    libpam: update to 1.1.4 and add subpackage xtests
>    cups: add pam support
>    screen: add pam support
>    sudo: add pam support
>    shadow: update pam related configure files
>
> Wenzong Fan (2):
>    cronie: enable PAM support for cronie
>    at: enable pam support
>
> Xiaofeng Yan (3):
>    dropbear: Support PAM
>    openssh: Support PAM
>    polkit: Support PAM
>
>   .../openssh/openssh-5.8p2/sshd                     |   10 +
>   meta/recipes-connectivity/openssh/openssh_5.8p2.bb |    7 +-
>   meta/recipes-core/dropbear/dropbear.inc            |    6 +-
>   .../dropbear/dropbear/dropbear-enable-pam.patch    |   21 +++
>   .../at/at-3.1.12/configure-add-enable-pam.patch    |   23 +++
>   meta/recipes-extended/at/at-3.1.12/pam.conf.patch  |   16 ++
>   meta/recipes-extended/at/at_3.1.12.bb              |   13 +-
>   .../cronie/cronie/crond_pam_config.patch           |   13 ++
>   meta/recipes-extended/cronie/cronie_1.4.7.bb       |    9 +-
>   meta/recipes-extended/cups/cups_1.4.6.bb           |    8 +-
>   .../pam/libpam/libpam-xtests.patch                 |   35 ++++
>   .../pam/{libpam_1.1.3.bb =>  libpam_1.1.4.bb}       |   14 +-
>   .../polkit/polkit-0.101/polkit-1_pam.patch         |   23 +++
>   meta/recipes-extended/polkit/polkit_0.101.bb       |    6 +-
>   .../screen/screen-4.0.3/screen.pamd                |    2 +
>   meta/recipes-extended/screen/screen_4.0.3.bb       |   14 +-
>   .../shadow/files/shadow-update-pam-conf.patch      |  175 ++++++++++++++++++++
>   meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |    5 +-
>   meta/recipes-extended/sudo/files/sudo.pamd         |    6 +
>   meta/recipes-extended/sudo/sudo_1.8.1p2.bb         |   11 +-
>   20 files changed, 389 insertions(+), 28 deletions(-)
>   create mode 100644 meta/recipes-connectivity/openssh/openssh-5.8p2/sshd
>   create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear-enable-pam.patch
>   create mode 100644 meta/recipes-extended/at/at-3.1.12/configure-add-enable-pam.patch
>   create mode 100644 meta/recipes-extended/at/at-3.1.12/pam.conf.patch
>   create mode 100644 meta/recipes-extended/cronie/cronie/crond_pam_config.patch
>   create mode 100644 meta/recipes-extended/pam/libpam/libpam-xtests.patch
>   rename meta/recipes-extended/pam/{libpam_1.1.3.bb =>  libpam_1.1.4.bb} (85%)
>   create mode 100644 meta/recipes-extended/polkit/polkit-0.101/polkit-1_pam.patch
>   create mode 100644 meta/recipes-extended/screen/screen-4.0.3/screen.pamd
>   create mode 100644 meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
>   create mode 100644 meta/recipes-extended/sudo/files/sudo.pamd
>


