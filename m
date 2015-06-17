Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4DBD97589D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 11:52:44 +0000 (UTC)
Received: by igboe5 with SMTP id oe5so77561126igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 04:52:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=WwelYkjXGA8o9sUxpEpkO6Xb2hZL6v1r96I+NhUmCPE=;
	b=aGoGP5Jcu3TH6a8fPzXIPpgq8UfZrnIUQ63qwITxH/fyB4FkZeetVeDp35otilxbBc
	MhbBv2rQA6gezTtxy8wqx1nM/4Z0QRtqjtZ3ujyRhG9J/pcpfKcAEunVGGGbbR9VYUzt
	l2Rit3ZZdN9iwD0vR1GhiUJOHFUsrJonpQpMhAAsWZVY8MF8GPsjRGljpehDZJ8Wsq99
	FeK20LCECoQwVLfoLk4PScHApQYra/ZC9iaaKrZnOUmMTs9m7cqpKK42N47NZvzp+J6e
	TEQn2zBvH24pfX2Bf2VI0CyArjH2OKXfVogPF48RXBZ5LaNaSuVf/YTen3E+PYOFBhD9
	3NQg==
X-Gm-Message-State: ALoCoQk2/HUw5RrX2z58/lcfdBxi6HWsuG9ul5Xp4joVL8xsGAFy7XdSXMgBprHfKFTg9m2hibeC
X-Received: by 10.50.50.98 with SMTP id b2mr10163962igo.42.1434541965804;
	Wed, 17 Jun 2015 04:52:45 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8C53F.dip0.t-ipconnect.de. [93.232.197.63])
	by mx.google.com with ESMTPSA id
	ot6sm11797789igb.11.2015.06.17.04.52.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Jun 2015 04:52:44 -0700 (PDT)
Message-ID: <1434541961.22011.91.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jun 2015 13:52:41 +0200
In-Reply-To: <1434536714-22457-2-git-send-email-patrick.ohly@intel.com>
References: <1434536714-22457-1-git-send-email-patrick.ohly@intel.com>
	<1434536714-22457-2-git-send-email-patrick.ohly@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Re: [PATCH] insane.bbclass: add indirect-build-deps QA check
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
X-List-Received-Date: Wed, 17 Jun 2015 11:52:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-06-17 at 12:25 +0200, Patrick Ohly wrote:
> However, there are at least two false positives left in the current code:
> * aliases for recipes via PROVIDES
> * unnecessarily linking against libs which are not really used
> 
> See the TODOs in the code.

Actually, I had written more about that which didn't make it into the
posted patch. Here's the more complete comment:


                        # TODO: check PROVIDES of the rdepend recipe to see whether that is
                        # listed in DEPENDS. Example: "smack" instead of "userspace-smack" in
                        # https://github.com/01org/meta-intel-iot-security/blob/master/meta-security-smack/recipes-extended/libpam/libpam_%25.bbappend which is an alias for
                        # https://github.com/01org/meta-intel-iot-security/blob/master/meta-security-smack/recipes-security/smack/smack-userspace_git.bb

                        # TODO: pam-plugin-cracklib/lib/security/pam_cracklib.so is unecessarily
                        # linked against libz.so.1, probably because of link flags from libcrack,
                        # which is what libpam calls and (correctly) lists as DEPENDS.
                        # Because libz is not listed as DEPENDS, we warn about it here
                        # unnecessarily. This could be fairly common; not sure how to detect
                        # it though, short of comparing symbol tables.


> +                        # TODO: check PROVIDES of the rdepend recipe to see whether that is
> +                        # listed in DEPENDS.
> +                        error_msg = "%s rdepends on %s, but it only an indirect build dependency?" % (pkg, rdepend)
> +                        sane = package_qa_handle_error("indirect-build-deps", error_msg, d)

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




