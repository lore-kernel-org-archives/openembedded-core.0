Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 4376D78743
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Feb 2018 07:09:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Feb 2018 23:09:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,482,1511856000"; d="scan'208";a="16486508"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga007.fm.intel.com with ESMTP; 08 Feb 2018 23:09:14 -0800
To: Mark Asselstine <mark.asselstine@windriver.com>
References: <20180202173815.9500-1-alexander.kanavin@linux.intel.com>
	<3144211.9qXzQgCZpO@yow-masselst-lx1>
	<00d7531e-b773-536e-ad5b-e19f8f993dbf@linux.intel.com>
	<1778379.J915XxZyfQ@yow-masselst-lx1>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <8f3fceb1-bb2b-de95-acd0-947ccc7a674e@linux.intel.com>
Date: Fri, 9 Feb 2018 09:03:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1778379.J915XxZyfQ@yow-masselst-lx1>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] gtk-doc: update to 1.27
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
X-List-Received-Date: Fri, 09 Feb 2018 07:09:15 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02/09/2018 12:13 AM, Mark Asselstine wrote:
> The use of libunique is non-consequential here. The issue is that the gtk-doc
> package has imports which are not going to be present via direct runtime
> dependencies. Any sw which attempts to run the python scripts found in gtk-doc
> will fail in the same way unless the python3-six is installed via an indirect
> dependency. I didn't have a chance to dig in to this deeper today so I don't
> have more to add than this but the "import six" is pretty explicit and will
> fail unless this script is not meant to actually be run anytime, anywhere.

gtk-doc recipe does have a direct dependency on python3-six, subject to 
'api-documentation' in DISTRO_FEATURES. The reason it's conditional is 
that we don't want to build a ton of gtk-doc dependencies in the default 
case that used by almost everyone. Yes, this produces gtk-doc scripts 
that are not working, but they will not be run anyway, if gtk-doc 
capable recipes inherit the gtk-doc class, which will disable the 
gtk-doc feature. libunique was missing that inherit, the patch to fix 
that is now on oe-devl list. Take it and the issue will go away.

Alex

