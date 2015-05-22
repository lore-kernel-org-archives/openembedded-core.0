Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 675237322D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 10:51:57 +0000 (UTC)
Received: by wichy4 with SMTP id hy4so43071852wic.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 03:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=tFeTDagHSb4GzaAONpJ0vgsSo0EmpSZX/VkoVZEhOyg=;
	b=X5E83Upg//90cGrbV2eBJDogqjdy9UpW63YxThhkVd2in2FP5mRWOj8P6l7fFHULUw
	2Zmkog7d9No/Qr54uy1uA7Y2wqzzO7inRFmrYLI0O36xt356nsvU+YgNxiq08gmXxMIO
	o1wPVPBlw85BfnDUGPscAu4holRM9RxrKqX/Lkx1FcvK8gwTXlXj1PyNY57NOp9LWuv+
	nRyN4Z/UUutMZFZ0iNe0MDV8h3bFzkzj+0T5kPv2k2y3vU7oZMKpVCZWG4MH9F7aLhgG
	IKgJTKruSku53+yyuX69vvd5r9qJkTf//+VN+SW3MX1//hjb1+Qti4uVhQqea+ENDCKP
	/KzQ==
X-Gm-Message-State: ALoCoQllUT00RTjhph0zMR29zXfPdq+o1vDpr11GpJbr2Kv8DSnWulNRqizmS1AqcVUyzI/aqwSA
X-Received: by 10.194.82.38 with SMTP id f6mr13423459wjy.16.1432291918862;
	Fri, 22 May 2015 03:51:58 -0700 (PDT)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPSA id
	em17sm2545206wid.11.2015.05.22.03.51.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 May 2015 03:51:58 -0700 (PDT)
Message-ID: <555F0A4C.40607@dresearch-fe.de>
Date: Fri, 22 May 2015 12:51:56 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
References: <1431981187-24981-1-git-send-email-anibal.limon@linux.intel.com>
In-Reply-To: <1431981187-24981-1-git-send-email-anibal.limon@linux.intel.com>
Subject: Re: [PATCH] license_class: Add explicity avoid of CLOSED license in validations
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
X-List-Received-Date: Fri, 22 May 2015 10:52:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 18.05.2015 22:33, Aníbal Limón wrote:
> The CLOSED license isn't a generic license it is a set and can
> be any closed source license.
> 
> [YOCTO #7752]
> 
> Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
> ---
>  meta/classes/license.bbclass | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index 7972c79..756e7f0 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -80,6 +80,10 @@ python license_create_manifest() {
>                  lic_file = os.path.join(d.getVar('LICENSE_DIRECTORY', True),
>                                          pkg_dic[pkg]["PN"], "generic_%s" % 
>                                          re.sub('\+', '', lic))
> +                # add explicity avoid of CLOSED license because isn't generic
> +                if lic == "CLOSED":
> +                   continue
> +
>                  if not os.path.exists(lic_file):
>                     bb.warn("The license listed %s was not in the "\ 
>                              "licenses collected for recipe %s" 
> @@ -278,8 +282,10 @@ def find_license_files(d):
>                      lic_files_paths.append(("generic_" + license_type, path))
>                      break
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

