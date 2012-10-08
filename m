Received: from ams-iport-1.cisco.com ([144.254.224.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1TL6uj-00024G-GT
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Oct 2012 08:34:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1599; q=dns/txt; s=iport;
	t=1349677262; x=1350886862;
	h=message-id:date:from:mime-version:to:cc:subject:
	references:in-reply-to:content-transfer-encoding;
	bh=dkAPb+pvE60ZfQW6u3UyP3uJBgT5Qcwdw0uMZXGCaM4=;
	b=UDHBp7Y1u73GlEykLJjXsMNr0vyxQ8jux00+OlkBqCrTGivbFOpQCpUt
	MK4UFEzIXf2XG6DxdDh0jadU1ym1n5CbLdeM+1NpfSeSAKEIUTSd+RhNO
	n+pBnGrvP9ga5XIq70VnQEfSQgNA+9Oke7kEsmy5SaMZNJv+ZS5DgpUpi k=;
X-IronPort-AV: E=Sophos;i="4.80,551,1344211200"; d="scan'208";a="144912744"
Received: from ams-core-3.cisco.com ([144.254.72.76])
	by ams-iport-1.cisco.com with ESMTP; 08 Oct 2012 06:20:59 +0000
Received: from [10.54.74.11] (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-3.cisco.com (8.14.5/8.14.5) with ESMTP id q986KxjH020906;
	Mon, 8 Oct 2012 06:20:59 GMT
Message-ID: <507270CA.6020501@cisco.com>
Date: Mon, 08 Oct 2012 08:20:59 +0200
From: =?ISO-8859-1?Q?Martin_Erts=E5s?= <mertsas@cisco.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.7) Gecko/20120911 Thunderbird/10.0.7
MIME-Version: 1.0
To: Martin Ertsaas <mertsas@cisco.com>
References: <1349268675-7808-1-git-send-email-mertsas@cisco.com>
In-Reply-To: <1349268675-7808-1-git-send-email-mertsas@cisco.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] populate_sdk_base.bbclass: Make it possible to overrise the create_shar method of populate_sdk_base.
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
X-List-Received-Date: Mon, 08 Oct 2012 06:34:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/03/12 14:51, Martin Ertsaas wrote:
> From: Thomas Kristensen <thkriste@cisco.com>
>
> If you wish to change the install/unpack method of the sdk, this can now be done by making
> your own create_shar method, and setting a POPULATE_SDK_CREATE_SHAR_COMMAND variable to your
> new create_shar function.
>
> Signed-off-by: Thomas Kristensen <thkriste@cisco.com>
> Signed-off-by: Martin Ertsaas <mertsas@cisco.com>
> ---
>  meta/classes/populate_sdk_base.bbclass |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index 1c151d7..53b11a3 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -24,6 +24,8 @@ PID = "${@os.getpid()}"
>  
>  EXCLUDE_FROM_WORLD = "1"
>  
> +POPULATE_SDK_CREATE_SHAR_COMMAND ?= "create_shar"
> +
>  python () {
>      # If we don't do this we try and run the mapping hooks while parsing which is slow
>      # bitbake should really provide something to let us know this...
> @@ -56,7 +58,7 @@ fakeroot python do_populate_sdk() {
>  
>      bb.build.exec_func("tar_sdk", d)
>  
> -    bb.build.exec_func("create_shar", d)
> +    bb.build.exec_func(d.getVar("POPULATE_SDK_CREATE_SHAR_COMMAND", True), d)
>  }
>  
>  fakeroot populate_sdk_image() {
Have anyone had the change to look at this? Would greatly appreciate
some feedback on this. Might also consider making similar overloads for
tar_sdk and friends as well if this is something the community wants.

- Martin


