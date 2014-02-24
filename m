Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 93C406F15E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 17:23:44 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 Feb 2014 09:19:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,535,1389772800"; d="scan'208";a="488923282"
Received: from mcmahond-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.208])
	by orsmga002.jf.intel.com with ESMTP; 24 Feb 2014 09:23:44 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Mon, 24 Feb 2014 17:23:42 +0000
Message-ID: <15834807.CLDoMVSnAx@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.2 (Linux/3.13.3-201.fc20.x86_64; KDE/4.12.2; x86_64; ; )
In-Reply-To: <1393261393-9602-2-git-send-email-sgw@linux.intel.com>
References: <1393261393-9602-1-git-send-email-sgw@linux.intel.com>
	<1393261393-9602-2-git-send-email-sgw@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] sqlite: rename to match upstream versioning
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
X-List-Received-Date: Mon, 24 Feb 2014 17:23:47 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 24 February 2014 19:03:13 Saul Wold wrote:
> Since we are re-doing the version from a big number down to a dot
> based number we have to bump the Package Epoch (PE).
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  .../sqlite/{sqlite3_3080301.bb => sqlite3_3.8.3.1.bb}               | 6
> ++++-- 1 file changed, 4 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/sqlite/{sqlite3_3080301.bb =>
> sqlite3_3.8.3.1.bb} (71%)
> 
> diff --git a/meta/recipes-support/sqlite/sqlite3_3080301.bb
> b/meta/recipes-support/sqlite/sqlite3_3.8.3.1.bb similarity index 71%
> rename from meta/recipes-support/sqlite/sqlite3_3080301.bb
> rename to meta/recipes-support/sqlite/sqlite3_3.8.3.1.bb
> index 8ed01a9..ca3a05c 100644
> --- a/meta/recipes-support/sqlite/sqlite3_3080301.bb
> +++ b/meta/recipes-support/sqlite/sqlite3_3.8.3.1.bb
> @@ -2,12 +2,14 @@ require sqlite3.inc
> 
>  LIC_FILES_CHKSUM =
> "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
> 
> -SRC_URI = "http://www.sqlite.org/2014/sqlite-autoconf-${PV}.tar.gz"
> +PE = "1"
> +SQLITE_PV = "3080301"
> +SRC_URI = "http://www.sqlite.org/2014/sqlite-autoconf-${SQLITE_PV}.tar.gz"

Rather than hardcoding this, we could use inline python to compute it. 
This should work:

def sqlite_download_version(d):
    pvsplit = d.getVar('PV', True).split('.')
    return pvsplit[0] + ''.join([part.rjust(2,'0') for part in pvsplit[1:]])

SQLITE_PV = "${@sqlite_download_version(d)}"


Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

