Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id EB5DB6B215
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 21:40:34 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 16 Jul 2013 14:40:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,679,1367996400"; d="scan'208";a="332333235"
Received: from unknown (HELO [10.255.13.97]) ([10.255.13.97])
	by azsmga001.ch.intel.com with ESMTP; 16 Jul 2013 14:40:30 -0700
Message-ID: <51E5BDCE.8040107@linux.intel.com>
Date: Tue, 16 Jul 2013 14:40:30 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Qi.Chen@windriver.com
References: <cover.1373953711.git.Qi.Chen@windriver.com>
In-Reply-To: <cover.1373953711.git.Qi.Chen@windriver.com>
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V5 0/3] Add a method for image level user/group configuration
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
X-List-Received-Date: Tue, 16 Jul 2013 21:40:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/15/2013 11:27 PM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Changes from V4:
> 1. Take into consideration the possibility of whitespaces in /etc/passwd and /etc/group
> 2. Change bbfatal in perform_usermod and perform_groupmod to bbwarn. Please see detailed reason below.
>
> PackageA pulls in userA.
> Now we want userA to map to a fixed user ID without having to worry whether PackageA is installed.
> We can now use the following configuration to achieve this requirement.
> EXTRA_USERS_PARAMS += "
> usermod, -u 2013 userA; \
> "

What happens files that userA might have already created outside the 
home directory? I know that usermod will fixup the home directory and 
some mail related files.

Sau!


> After this configuration, if PacakgeA is installed in our image, the user ID is modified to 2013;
> otherwise, there's no change in /etc/passwd, i.e., userA will not be added to /etc/passwd silently.
>
> Hope this information will be useful.
>
> //Chen Qi
>
>
> The following changes since commit a63229917a5708de2d161aba0d67168ce0da6365:
>
>    meta-yocto-bsp: update reference board SRCREVs (2013-07-10 09:45:51 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib ChenQi/extrausers
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/extrausers
>
> Chen Qi (3):
>    useradd_base.bbclass: add a new bbclass
>    useradd.bbclass: code refactor
>    extrausers.bbclass: add a new bbclass
>
>   meta/classes/extrausers.bbclass   |   61 ++++++++++
>   meta/classes/useradd.bbclass      |   99 ++--------------
>   meta/classes/useradd_base.bbclass |  230 +++++++++++++++++++++++++++++++++++++
>   3 files changed, 299 insertions(+), 91 deletions(-)
>   create mode 100644 meta/classes/extrausers.bbclass
>   create mode 100644 meta/classes/useradd_base.bbclass
>

