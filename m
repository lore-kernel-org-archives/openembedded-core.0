Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TlilJ-0008Mb-Dk
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 17:14:36 +0100
Received: from mail-ye0-f197.google.com ([209.85.213.197])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 20 Dec 2012 07:59:35 -0800
Received: by mail-ye0-f197.google.com with SMTP id q9so5112449yen.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2012 07:59:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=auDohiQ9uPVJHuMlu+o7R88xsWn3mlxIz+oAuEKQR3Y=;
	b=cxItMGbZQLIIkghghRpCsjfZZ6uBS4cAZCe76DcqNmmd3VowctilHNXQ3wm4DYNtyu
	HnqLPtZ0XZLBwqjloK9llc6JN9oLhHlio9qPCGc2LbZl/JV3EPbUSEzAlAYV1x5IoIxS
	SDgbqxW2EgZQRuz31s/qjEqIoViFcFZHXbRgGDOp8nPWyydBiINqX9KHmRDl0nADl7LD
	boeO755TTs3Xfhc0k9Sglt9fBshpdrOYp/PktjEiIm4BIFIinmqKqgacW1rXyyMiTWuG
	7AJ4et/h54D5um1SCXBOPToTrftH6cYMM+Lm1OI9dPklDJLDpOrMNV2D5Bhme7FN7fgM
	8vwg==
X-Received: by 10.58.155.99 with SMTP id vv3mr15322594veb.50.1356019174324;
	Thu, 20 Dec 2012 07:59:34 -0800 (PST)
Received: by 10.58.155.99 with SMTP id vv3mr15322574veb.50.1356019174233; Thu,
	20 Dec 2012 07:59:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Thu, 20 Dec 2012 07:59:14 -0800 (PST)
In-Reply-To: <1356016878.24487.187.camel@phil-desktop>
References: <1355933032-25392-1-git-send-email-laurentiu.palcu@intel.com>
	<1356016878.24487.187.camel@phil-desktop>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Dec 2012 15:59:14 +0000
Message-ID: <CAJTo0Lb5Z67naXx-pFWd_ksEP5SYpd0qnDzv801UO9MpLB1PdQ@mail.gmail.com>
To: Phil Blundell <philb@gnu.org>
X-Gm-Message-State: ALoCoQmMqJVGQKpJuxaMGwkUmZ4RZGtkSGQJ/Nmczf+jwiGuW8x9xyHRVT++gA4Rib4cNWXkHVHQoYHqQAhyU7nFpIIK/JxzR4I5ba4zxEEQCFGzDuS454MZ97rsfCLPA3fxrWAOXbUqPd19O5B2Bm3nx0FDUXe7GqlQNH1MOolemFAXuC43Th0OHd2MMgqbbMrVlOOGYYlT
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pango: have postinstalls run at do_rootfs time
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
X-List-Received-Date: Thu, 20 Dec 2012 16:14:37 -0000
Content-Type: text/plain; charset=UTF-8

On 20 December 2012 15:21, Phil Blundell <philb@gnu.org> wrote:
> On Wed, 2012-12-19 at 18:03 +0200, Laurentiu Palcu wrote:
>> Since pango-native is built anyway and all the modules are in the native
>> sysroot, create the cache file by scanning those files instead of the
>> target files. The latter will fail because the shared objects wouldn't
>> be from the same ELF class.
>
> Is it guaranteed that the native build will have the same set of
> modules?  It seems to me that it would be safer to scan the target ones
> under qemu as you did for gtk-immodules.

I suspected there was no such real thing as an out-of-tree Pango
module, but I was wrong (http://graphite.sil.org/).

Digging quickly into the Debian packaging, they generate the modules
list at build time (not in a postinst) by running pango-querymodules
over the directories they just built, filtering the paths (this
happens in dh_pangomodules).  They also generate a modules list file
per package and ship it, and pango reads the multiple files.  I'm not
sure if this is upstream behaviour or a Debian-specific patch.

Ross


