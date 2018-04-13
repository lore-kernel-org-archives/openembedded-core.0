Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 793F274525
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 06:55:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Apr 2018 23:55:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,444,1517904000"; d="scan'208";a="43003186"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 12 Apr 2018 23:55:13 -0700
To: Juro Bystricky <juro.bystricky@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1523572087-34315-1-git-send-email-juro.bystricky@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <94fbeffa-e80a-2160-d6b7-d76aa779b941@linux.intel.com>
Date: Fri, 13 Apr 2018 09:48:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1523572087-34315-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: Re: [PATCH] glib-2.0/glib.inc: fix broken mingw build
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
X-List-Received-Date: Fri, 13 Apr 2018 06:55:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/13/2018 01:28 AM, Juro Bystricky wrote:
> mingw build was broken by the commit:
> "glib-2.0/glib.inc: apply MLPREFIX renaming to all package classes"
> 
> When building for mingw, we encounter build errors such as:
> 
>    mv: cannot stat '<builddir>/<...>/usr/libexec/gio-querymodules': No such file or directory
> 
> The file that exists is actually "gio-querymodules.exe", but still there is no
> good reason to rename it to "nativesdk-gio-querymodules.exe".
> So for mingw we simply avoid renaming of the executable, by skippng the line:
> 
>    mv -v ${D}${libexecdir}/gio-querymodules ${D}${libexecdir}/${MLPREFIX}gio-querymodules
> 
> [YOCTO #12679]

The reason for the renaming is that postinst_intercept logic will try to 
execute the binary with the mlprefix, when running populate_sdk. I think 
this is not gonna work with your patch, and the bug does not mention 
that you tried it.

I think the better approach is to accommodate the exe suffix when doing 
the move:

mv -v ${D}${libexecdir}/gio-querymodules${EXEEXT} 
${D}${libexecdir}/${MLPREFIX}gio-querymodules${EXEEXT}

Alex

