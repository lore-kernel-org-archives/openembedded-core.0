Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Th7OC-00047o-51
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Dec 2012 00:31:28 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qB7NH1Pd001171
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Dec 2012 15:17:01 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Fri, 7 Dec 2012 15:17:00 -0800
Message-ID: <50C278FE.8060705@windriver.com>
Date: Fri, 7 Dec 2012 17:17:18 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:16.0) Gecko/20121026 Thunderbird/16.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1354923030-23316-1-git-send-email-mark.hatle@windriver.com>
In-Reply-To: <1354923030-23316-1-git-send-email-mark.hatle@windriver.com>
Subject: Re: [PATCH 4/6 v3] package_rpm: Update the way the multilib package names are translated
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Dec 2012 23:31:28 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/7/12 5:30 PM, Mark Hatle wrote:
> The variable MULTILIB_PACKAGE_ARCHS has been removed in favor of a
> repurposed MULTILIB_PREFIX_LIST.  The format of this item is now
> <libid>:<arch>:<arch1>:...:<archN>.  This ensures that we can correctly
> translate the libid to one of the supported archs in a tri-lib system.
>
> All of the users of MULTILIB_PREFIX_LIST and MULTILIB_PACKAGE_ARCHS have
> been modified accordingly.
>
> Also change the way attempted packages are installed, verify the package
> exists in the translate functions, then perform the install in one single
> operation.  This results in a significantly faster install time.

FYI changes from v2 involve a new flag to the translate_oe_to_smart function. 
This flag instructs the system that we are processing 'SDK' packages, ensuring 
that only the right set get passed in as available to install.

> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>   meta/classes/package_rpm.bbclass      |  185 ++++++++++++++++++++++++++++++--
>   meta/classes/populate_sdk_rpm.bbclass |   28 +++--
>   meta/classes/rootfs_rpm.bbclass       |   47 ++++-----
>   3 files changed, 214 insertions(+), 46 deletions(-)
>



