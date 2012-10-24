Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TR3SO-00059m-54
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 18:05:24 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Oct 2012 08:51:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,640,1344236400"; d="scan'208";a="239555776"
Received: from unknown (HELO [10.255.14.104]) ([10.255.14.104])
	by fmsmga002.fm.intel.com with ESMTP; 24 Oct 2012 08:51:50 -0700
Message-ID: <50880E96.30307@linux.intel.com>
Date: Wed, 24 Oct 2012 08:51:50 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Martin Ertsaas <mertsas@cisco.com>
References: <1350627387-20385-1-git-send-email-mertsas@cisco.com>
In-Reply-To: <1350627387-20385-1-git-send-email-mertsas@cisco.com>
Cc: Thomas Kristensen <thkriste@cisco.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] populate_sdk_base.bbclass: Make it possible to overrise the create_shar method of populate_sdk_base.
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
X-List-Received-Date: Wed, 24 Oct 2012 16:05:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/18/2012 11:16 PM, Martin Ertsaas wrote:
> From: Thomas Kristensen <thkriste@cisco.com>
>
> If you wish to change the install/unpack method of the sdk, this can now be done by making
> your own create_shar method, and setting a SDK_PACKAGAING_FUNC variable to your
> new create_shar function.
>
> Signed-off-by: Thomas Kristensen <thkriste@cisco.com>
> ---
>   meta/classes/populate_sdk_base.bbclass |    4 +++-
>   1 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index 6eb6726..a914a2c 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -24,6 +24,8 @@ PID = "${@os.getpid()}"
>
>   EXCLUDE_FROM_WORLD = "1"
>
> +SDK_PACKAGING_FUNC ?= "create_shar"
> +
>   python () {
>       # If we don't do this we try and run the mapping hooks while parsing which is slow
>       # bitbake should really provide something to let us know this...
> @@ -56,7 +58,7 @@ fakeroot python do_populate_sdk() {
>
>       bb.build.exec_func("tar_sdk", d)
>
> -    bb.build.exec_func("create_shar", d)
> +    bb.build.exec_func(d.getVar("SDK_PACKAGING_FUNC", True), d)
>   }
>
>   fakeroot populate_sdk_image() {
>
Merged into OE-Core

Thanks
	Sau!


