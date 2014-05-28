Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (unknown [209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id B35B265E05
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 10:48:50 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id q108so16810778qgd.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 03:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=FdzvRowkaVynN2rQcPgXJ5FHUcY0CJ6Mu2BSlQ2hWR4=;
	b=dfkTpgOlNwf+nL92LA//HNEf2KqB8WjIXbWjVbVnlyVha7vz5VnxrManRTSixsPts2
	YVpSp2jXwc/PB33jFS8pltJgdO24QMvDfadYR90ntlYP+XLMSRAvhkRvdnCAqzBGOsWK
	PQORawSmBeebItHSfVZ+0cmZE1Urxjy6n9MeBGEEvzCMOOMfZK4HYk/31U/UdQW24ScA
	H/ZdQKi06mB0CBg5CzuzGozHYmzFXCGWGtawhik/uhvSnbdJ4ajPTqeVf1UgJmB+dHb/
	cbOZZyol7e7/qpiXGebYUbUejKBgIM/qb1WO9nXDTW+vxHSAvuE4OA/rp79EMq/TyRsG
	+GpQ==
X-Gm-Message-State: ALoCoQkkwMNskh/oixv/cze7NTVlGbqexplNchiXNzQaehb4x5skYYDmoPf8Q+rJsBUrg9OXLCG3
X-Received: by 10.224.165.70 with SMTP id h6mr22841900qay.78.1401274131133;
	Wed, 28 May 2014 03:48:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Wed, 28 May 2014 03:48:31 -0700 (PDT)
In-Reply-To: <bf82873db79aba78e0ecb8b744d30fc6839c9f99.1401267658.git.hongxu.jia@windriver.com>
References: <cover.1401267658.git.hongxu.jia@windriver.com>
	<bf82873db79aba78e0ecb8b744d30fc6839c9f99.1401267658.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 28 May 2014 11:48:31 +0100
Message-ID: <CAJTo0La0d-hJs9-Lgpaw_4Zm4gJ2=Y9F47J-SPcTbwACa62mrg@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Saul Wold <saul.wold@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] apr: fix cross compiling failed
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
X-List-Received-Date: Wed, 28 May 2014 10:48:52 -0000
Content-Type: text/plain; charset=UTF-8

On 28 May 2014 10:05, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> The tools/gen_test_char was invoked at build time, and it didn't
> work for the cross compiling, so we used the native one to instead.

Building all of libapr natively and installing the extra binary is
wasteful when the binary is trivially compiled natively in the target
build.

Simply add a do_compile_prepend() that uses BUILD_CC and so on to
compile tools/gen_test_char.  As it only uses standard C headers this
is trivial and you won't need to patch the build at all (obviously
test when MACHINE is massively incompatible with the host, ie qemuarm
with x86 host).

Ross

