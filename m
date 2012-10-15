Received: from ams-iport-2.cisco.com ([144.254.224.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1TNesb-0001So-Qg
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Oct 2012 09:14:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1370; q=dns/txt; s=iport;
	t=1350284473; x=1351494073;
	h=message-id:date:from:mime-version:to:subject:references:
	in-reply-to:content-transfer-encoding;
	bh=gNAZ9Jcw2WkssbGqw0C1/6QgWsBqXmePkGKNexIbjiA=;
	b=OaevT9F5jf0mn2s+sPv6lTz4ToDl/b8k8vHUtjHZUFPkWg11h+fwt6j4
	/Lgpb6XesN2AIhMUHiRwSY92erEGjbTsP5GQDoVUKOD7J3w+rfyWYnYb1
	di9WeLYlo9usFCrrKhUhe4RSUmOJNH8lEyLYo+Vz5zj6p7/nwiG1d1851 U=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Av8EAFi0e1CQ/khL/2dsb2JhbABFv3aBCIIgAQEBBBIBZRELFQMJFgQLCQMCAQIBRRMGAgEBHodinT6fJo51gyEDlWyFYoNbhQiBa4Jv
X-IronPort-AV: E=Sophos;i="4.80,587,1344211200"; d="scan'208";a="77471596"
Received: from ams-core-2.cisco.com ([144.254.72.75])
	by ams-iport-2.cisco.com with ESMTP; 15 Oct 2012 07:01:09 +0000
Received: from [10.54.74.11] (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-2.cisco.com (8.14.5/8.14.5) with ESMTP id q9F719Go014580
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2012 07:01:10 GMT
Message-ID: <507BB390.7050203@cisco.com>
Date: Mon, 15 Oct 2012 08:56:16 +0200
From: =?ISO-8859-1?Q?Martin_Erts=E5s?= <mertsas@cisco.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.7) Gecko/20120911 Thunderbird/10.0.7
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1349693030-31861-1-git-send-email-mertsas@cisco.com>
In-Reply-To: <1349693030-31861-1-git-send-email-mertsas@cisco.com>
Subject: Re: [[PATCH v3]] populate_sdk_base.bbclass: Make it possible to override the create_shar method of populate_sdk_base.
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
X-List-Received-Date: Mon, 15 Oct 2012 07:14:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/08/12 12:43, Martin Ertsaas wrote:
> From: Thomas Kristensen <thkriste@cisco.com>
>
> If you wish to change the install/unpack method of the sdk, this can now be done by making
> your own create_shar method, and setting a SDK_PACKAGING_FUNC variable to your
> new create_shar function.
>
> Signed-off-by: Thomas Kristensen <thkriste@cisco.com>
> ---
>  meta/classes/populate_sdk_base.bbclass |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index 1c151d7..762ba12 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -24,6 +24,8 @@ PID = "${@os.getpid()}"
>  
>  EXCLUDE_FROM_WORLD = "1"
>  
> +SDK_PACKAGING_FUNC ?= "create_shar"
> +
>  python () {
>      # If we don't do this we try and run the mapping hooks while parsing which is slow
>      # bitbake should really provide something to let us know this...
> @@ -56,7 +58,7 @@ fakeroot python do_populate_sdk() {
>  
>      bb.build.exec_func("tar_sdk", d)
>  
> -    bb.build.exec_func("create_shar", d)
> +    bb.build.exec_func(d.getVar("SDK_PACKAGING_FUNC", True), d)
>  }
>  
>  fakeroot populate_sdk_image() {
Have anyone had time to look at this, and if so, is it suitable for
upstream?

- Martin


