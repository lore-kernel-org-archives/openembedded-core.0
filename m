Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9E5FD6B5AA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 21:01:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Aug 2013 14:01:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,848,1367996400"; d="scan'208";a="383999628"
Received: from unknown (HELO [10.255.14.176]) ([10.255.14.176])
	by fmsmga002.fm.intel.com with ESMTP; 09 Aug 2013 14:01:21 -0700
Message-ID: <520558A1.1010702@linux.intel.com>
Date: Fri, 09 Aug 2013 14:01:21 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Hongxu Jia <hongxu.jia@windriver.com>
References: <cover.1375953812.git.hongxu.jia@windriver.com>
In-Reply-To: <cover.1375953812.git.hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 0/2] add perl database support packages
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
X-List-Received-Date: Fri, 09 Aug 2013 21:01:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


I believe the plan is to create a meta-cpan in which recipes like this 
can then live, not in oe-core.

Sau!


On 08/08/2013 02:51 AM, Hongxu Jia wrote:
> Change in V2:
>    * Rename recipe to use libdbd-sqlite-perl instead of libdbm-sqlite-perl
>
> In oe-core, only SQLite is supported, so we add perl-DBI and perl-DBD-SQLite.
>
> Test Case:
>
> 1) vim local.conf:
> ...
> IMAGE_INSTALL_append = " libdbd-sqlite-perl"
> PERL_DBM_TEST = "1"
> ...
> 2) build core-image-sato and boot the target
>
> 3) run "sqlite-perl-test.pl" in target
> ...
> root@qemuarm:~# sqlite-perl-test.pl
> Connect to SQLite's in-memory database
> Create table tbl1(name varchar(10), id smallint)
> Insert into tbl1 values('yocto',10)
> Insert into tbl1 values('windriver', 20)
> Select * from tbl1
> -----------------------------------
> yocto: 10
> windriver: 20
>
> Update tbl1 set name = 'oe-core' where id = 10
> Delete from tbl1 where id = 20
> Select * from tbl1
> -----------------------------------
> oe-core: 10
>
> Test Success
> ...
>
> //Hongxu
>
> The following changes since commit 9de0ad47462c13ac4a2d73e12e92be6c1b4e0415:
>
>    genericx86: ship all the driver firmware by default (2013-07-31 07:00:00 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib hongxu/perl-dbi
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/perl-dbi
>
> Hongxu Jia (2):
>    libdbi-perl: add version 1.628
>    libdbd-sqlite-perl: add version 1.40
>
>   .../perl/files/sqlite-perl-test.pl                 | 69 ++++++++++++++++++++++
>   .../perl/libdbd-sqlite-perl_1.40.bb                | 40 +++++++++++++
>   meta/recipes-extended/perl/libdbi-perl_1.628.bb    | 27 +++++++++
>   3 files changed, 136 insertions(+)
>   create mode 100755 meta/recipes-extended/perl/files/sqlite-perl-test.pl
>   create mode 100644 meta/recipes-extended/perl/libdbd-sqlite-perl_1.40.bb
>   create mode 100644 meta/recipes-extended/perl/libdbi-perl_1.628.bb
>

