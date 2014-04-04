Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id AF9DC6B200
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 20:02:07 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id q108so3844034qgd.38
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Apr 2014 13:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=mZbuMVtJnaCcPzdxEgJQVc3PzYRIq+1wcYOvSBm65W8=;
	b=LONddchi+q9X48qhErwmZribt9BwhEMwcqeZdjU8ExshuOjAGgltpys4yQE4bmYT/g
	Wj4oMyg7CpwOieKSMgzDPRQ18ZLcN0P3ztOp0UX4pPKhw2XbIl89f6pEuGQYxI3FpOz4
	hDpm5skxn8Z9nOv4pcibGCPL9PmfZ5iIrp0NY3qgcDJqQLm7TLrLoYeKKcKGWBoOF09U
	enEjr2fsJNn3JXoIZ4fFeKlYn/QX9nEi3VnrqaUJtN/HlqoF+NQKk/MvNhd9wDCa1s3P
	6A3iL5MfNniCaq+Tf8fIYIDqkmZj2BlcUR+Q7UsseG2KT6P9mdPcYLvsGpO0Yq2J4TUa
	9yHw==
X-Gm-Message-State: ALoCoQkVEfwllcrq872rdnZmf/93fRETFXYE5Vcgfbz15V7smzGgdEGFOkZJshWsX8qtqTzSprjT
X-Received: by 10.224.147.77 with SMTP id k13mr17046850qav.64.1396641728711;
	Fri, 04 Apr 2014 13:02:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.27.167 with HTTP; Fri, 4 Apr 2014 13:01:48 -0700 (PDT)
In-Reply-To: <533EE97D.90207@windriver.com>
References: <CALbNGRR3cOLUR+HBKkfSqLMRL75sn7uzEace23KJLYy43F1Vtg@mail.gmail.com>
	<CALbNGRShXafNdCYR62h3tpQ4RLTXyZTgvrs0xBOhsn_Z57=sdg@mail.gmail.com>
	<533EE97D.90207@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 Apr 2014 21:01:48 +0100
Message-ID: <CAJTo0LYdmV9bTdttrO_kkjXRGuH3xC9c_h_EnGEo6=dcbxuBdg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: util-macros.do_package failed Re: Build failure
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
X-List-Received-Date: Fri, 04 Apr 2014 20:02:12 -0000
Content-Type: text/plain; charset=UTF-8

On 4 April 2014 18:18, Robert Yang <liezhi.yang@windriver.com> wrote:
> Maybe we can let the do_package depend on base-passwd:do_populate_sysroot
> to fix the problem.

I keep on thinking that we need to effectively have a readers/writer
lock on the sysroot, so that e.g. do_compile() takes a read lock and
do_populate_sysroot() takes a write lock.  This way very slim races
such as this (and aclocal disappearing, and binaries being re-written
whilst being executed, etc) just can't happen.  By having a
readers/writer lock the stalls for the actual populate of the sysroot
shouldn't have too great an impact, and would let us remove other
workarounds we've added (such as the baroque aclocal-copy).

Ross

