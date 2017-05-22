Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 76A0E60110
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 13:10:05 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP; 22 May 2017 06:10:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,377,1491289200"; d="scan'208";a="859949348"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 22 May 2017 06:10:05 -0700
To: Max Krummenacher <max.oss.09@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20170519154856.21505-1-max.krummenacher@toradex.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <ea81f53d-203f-183b-3a51-b0d71301b384@linux.intel.com>
Date: Mon, 22 May 2017 16:08:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170519154856.21505-1-max.krummenacher@toradex.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [PATCH v2] libsolv: don't pick up bundled db from host rpm
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
X-List-Received-Date: Mon, 22 May 2017 13:10:06 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/19/2017 06:48 PM, Max Krummenacher wrote:
> +   # check if rpm contains a bundled berkeley db
> +-  CHECK_INCLUDE_FILE(rpm/db.h HAVE_RPM_DB_H)
> ++  CHECK_LIBRARY_EXISTS(rpm.so db_create_rpmdb "" HAVE_RPM_DB_H)

Sorry Max, this is actually worse than the first version. HAVE_RPM_DB_H 
has to accurately reflect the presence or absence of the header, as that 
header is later included or not included depending on that. You cannot 
set it based on checking some library.

So please either fix CHECK_INCLUDE_FILE, or let's revert to the first 
version of the patch, as it at least doesn't introduce a new issue.

Alex

