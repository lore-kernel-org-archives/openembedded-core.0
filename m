Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id C83B07029A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 08:46:59 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id i17so2079868qcy.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 01:47:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Jv0kcMyCP9TNm5Xwb30MuZPdXgKRklzI2TkOyrSkLtc=;
	b=QdqLmejJPb28dzKo9NWXBliY6ayHPvBeMLoBxd1KkQl2xe6w/U4gaXoaE1VmQu7E5L
	XEYwx2bYYkSdZbDrkKvip6u83QWHDJYmeHyDi6U5KNKkA9+ucmwtwWTRtzg2YIO5Cue2
	kZGvBY7aSgkhlSlEJOsnV7tJoZXFAN8piVp1W1Ece5vzinO9LPFFF9S9uLK6iwlxtjXp
	9hKIcqIf5il3/idZ0FP2PIIUtSdX0mj+6WbIgIlH/GfIe0O4ixSEtHAV1oHwwyRcB/ed
	GG5u4tnlh2uMeQF//TVBlKdSLVpH5GbbdUCqoSwI4nPUH6OYS5OK77SFumIVMQhMgFSS
	tqzw==
X-Gm-Message-State: ALoCoQkXF1GTqZhfKiGDprtKFq6fIoFmEdsRBBbTBcz7cqjV2iyElhfziBP2UsrUENTRDHVD4Q6Y
X-Received: by 10.140.89.197 with SMTP id v63mr31203546qgd.71.1405414020596;
	Tue, 15 Jul 2014 01:47:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Tue, 15 Jul 2014 01:46:40 -0700 (PDT)
In-Reply-To: <53C46FEC.3080006@linux.intel.com>
References: <1405019902-31691-1-git-send-email-drew_moseley@mentor.com>
	<53C46FEC.3080006@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 15 Jul 2014 09:46:40 +0100
Message-ID: <CAJTo0LaZJzF1y=jp2ZV+sNV+6Kr9G9ez-BNvT6gUY3sgNvBrQw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libomxil-0.9.3: Move .so files to main package.
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
X-List-Received-Date: Tue, 15 Jul 2014 08:47:05 -0000
Content-Type: text/plain; charset=UTF-8

On 15 July 2014 01:03, Saul Wold <sgw@linux.intel.com> wrote:
> On 07/10/2014 12:18 PM, Drew Moseley wrote:
>>
>> The omxregister-bellagio app scans the libdir for the '*.so'
>> files to get them properly registered.  Make sure they are
>> included in the base package rather than the dev.
>>
> Would it be better to patch the register app to have a more generic search
> for .so*??

Searching for .so is fine if you're looking for loadable modules, but
as the package contains versioned real files and lots of symlinks
they're Doing It Wrong.  A better fix would be to fix the build so
that it installs unversioned loadable modules, and then ensure that
they're in the main package (a real .so file in $PN shoudn't kick a QA
error, either).

I think the magic libtool options are -avoid-version -module -shared.

Ross

