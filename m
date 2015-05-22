Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 066D56B0CB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 10:51:29 +0000 (UTC)
Received: by wgfl8 with SMTP id l8so14039448wgf.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 03:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=JPI+UPWHsXwUgsh0XNawg4KVxTWuy+jyqpZuj0M1LJI=;
	b=IYA7iA7fV4yq9ZRnxiYp61Bd8gQhs0l22FvsH5fVSStN5gkj6+5XVyYujeXX2ZYSfw
	TFh9Jj0UT/v+WDD3GTfjLBwTjyJETHjxOm47Z/RZ5g4uC4Oh2Ue9Gegya6cZEQBPFa4u
	BFCdA7FmSN6ouL/CqGX9LPbG/GcJaPUzGqI9YjeC4aHTB4Ynoy9Oc58kD75nQz91NFV+
	xYf5hVGGCXA3LLFM46gI3ynx9b8KiiSObTZWEw9zgdfwak/G/8B1wrGE3I8r7Qvn+0Vf
	VJdHa8rcNEPKEOnN//r7RufgYvnH9SCVDeJeyukyUqGOg+9lx8X3CU29sorueLMUnrkJ
	O57w==
X-Gm-Message-State: ALoCoQlmVTwKtpEGUpg8odepGjrtiXRkm5Zd+ro/T+VmN+CxBmAhwVXim4vIBAFJeusTdcZ3M6GI
X-Received: by 10.194.235.100 with SMTP id ul4mr13582310wjc.33.1432291890231; 
	Fri, 22 May 2015 03:51:30 -0700 (PDT)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPSA id be3sm6923158wib.21.2015.05.22.03.51.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 May 2015 03:51:29 -0700 (PDT)
Message-ID: <555F0A2F.4030905@dresearch-fe.de>
Date: Fri, 22 May 2015 12:51:27 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
References: <1431976652-15590-1-git-send-email-anibal.limon@linux.intel.com>
In-Reply-To: <1431976652-15590-1-git-send-email-anibal.limon@linux.intel.com>
Subject: Re: [FIDO][PATCH] license_class: Add explicity avoid of CLOSED license in validations
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
X-List-Received-Date: Fri, 22 May 2015 10:51:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 18.05.2015 21:17, Aníbal Limón wrote:
> The CLOSED license isn't a generic license it is a set and can
> be any closed source license.
> 
> [YOCTO #7752]
> 
> Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
> ---
>  meta/classes/license.bbclass | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index 73a0e97..fdc1170 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -71,6 +71,11 @@ license_create_manifest() {
>  
>  		lics="$(echo ${pkged_lic} | sed "s/[|&()*]/ /g" | sed "s/  */ /g" )"
>  		for lic in ${lics}; do
> +			# add explicity avoid of CLOSED license because isn't generic
> +			if [ "$lic" = "CLOSED" ]; then
> +				continue
> +			fi
> +
>  			# to reference a license file trim trailing + symbol
>  			if ! [ -e "${LICENSE_DIRECTORY}/${pkged_pn}/generic_${lic%+}" ]; then
>  				bbwarn "The license listed ${lic} was not in the licenses collected for ${pkged_pn}"
> @@ -242,8 +247,10 @@ def find_license_files(d):
>  
>              lic_files_paths.append(("generic_" + license_type, os.path.join(license_source, spdx_generic)))
>          else:
> -            # And here is where we warn people that their licenses are lousy
> -            bb.warn("%s: No generic license file exists for: %s in any provider" % (pn, license_type))
> +            # Add explicity avoid of CLOSED license because this isn't generic
> +            if license_type != 'CLOSED':
> +                # And here is where we warn people that their licenses are lousy
> +                bb.warn("%s: No generic license file exists for: %s in any provider" % (pn, license_type))
>              pass
>  
>      if not generic_directory:

ACK

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

