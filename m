Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f169.google.com (mail-vc0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id C036261485
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 14:35:34 +0000 (UTC)
Received: by mail-vc0-f169.google.com with SMTP id ia10so156742vcb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jul 2013 07:35:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=oHziwW5hH1d833kaIBnVwP1r1qLEHFFYlhUWnLkXyG0=;
	b=RTU/l8vs+Tgy8O5s+MslLV8PplplL0RmFd6BMcf16qMUzBLSbHDQARJPmjTZ3Sugjz
	5DmUxpsHMlG4j2aGaPVBraoLR3QVUftkBLYskuIIwND4PLi56MZYmBotvPLRTpA5w5mU
	2pUH+lHIkoAvgcQFRVQdhAAxOt/1UuzKTVe4iQxA1ls+MLT146JEDtZ1EgQY63aNYypg
	gMw6oMEMeDEIXIxm6m0gi8HW3d8yRyrOEbvHvN8ivqzVX6rO6m8WsVrpspru1SK51jbp
	/9rVkTpUFt9v1PgRXLwajrV5orvBmRdxAGPo9HBJuoiEuuxRX9vT9RS8wiKlANkLA8ws
	AQFQ==
X-Received: by 10.220.42.147 with SMTP id s19mr363474vce.46.1372862135616;
	Wed, 03 Jul 2013 07:35:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Wed, 3 Jul 2013 07:35:15 -0700 (PDT)
In-Reply-To: <1372858838-17887-1-git-send-email-paul.eggleton@linux.intel.com>
References: <1372858838-17887-1-git-send-email-paul.eggleton@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Jul 2013 15:35:15 +0100
Message-ID: <CAJTo0LaoRo3urg=M8n5+V0zD9y8RzJ=dRZPjYBupz8mR_HiWQQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQlHOo3pxKdfEEUGJc3kvZR2eA+3335KXkv7L4v1KZuqYR1uKgcNV98/vQ24OD2IYZWPWGQl
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] classes/insane: fix libdir check regexes
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
X-List-Received-Date: Wed, 03 Jul 2013 14:35:35 -0000
Content-Type: text/plain; charset=UTF-8

On 3 July 2013 14:40, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> +    lib_re = re.compile("^/lib.*\.so[0-9.]*$")
> +    exec_re = re.compile("^%s.*/lib.*\.so[0-9.]*$" % exec_prefix)

I'd been meaning to double-check this assumption since the discussion
yesterday, and I'm glad I did.  My Debian machine has these files in
/usr/lib that don't match that regex:

libatlas.so.3gf
libblas.so.3gf
libcblas.so.3gf
libf77blas.so.3gf
liblapack_atlas.so.3gf
liblapack.so.3gf
libmozjs.so.10d
libnspr4.so.0d
libnss3.so.1d
libnssutil3.so.1d
libplc4.so.0d
libplds4.so.0d
libsmime3.so.1d
libssl3.so.1d

How about ^lib.+\.so(\..+)?$ to match a library filename?

Ross

