Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 08149774E5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 14:43:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u53EhqNA005729
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 3 Jun 2016 07:43:52 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 3 Jun 2016 07:43:51 -0700
To: "Maxin B. John" <maxin.john@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1464953991-4125-1-git-send-email-maxin.john@intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <cf6e48c8-4fc8-aaec-87d2-940623951477@windriver.com>
Date: Fri, 3 Jun 2016 09:43:51 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <1464953991-4125-1-git-send-email-maxin.john@intel.com>
Subject: Re: [PATCH 1/2] rpm: update patch to support db-6.2.23
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
X-List-Received-Date: Fri, 03 Jun 2016 14:43:54 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 6/3/16 6:39 AM, Maxin B. John wrote:
> Refresh the rpm-db60.patch to support db-6.2.23

NAK NAK NAK

Please do NOT merge this set.

6.2.23 does NOT work with the version of RPM.

They (BDB) changed something with the locking semantics.  If you do anything
more then a trivial test you will end up with a corrupted database.

The RPM5 community is working on a newer version of RPM5, that will likely adapt
to the new semantics.  I've not yet seen it released.  When it does, -and- if it
works w/ db 6.2.23, we can consider the upgrade at that time.

--Mark

> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  meta/recipes-devtools/rpm/rpm/rpm-db60.patch | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/recipes-devtools/rpm/rpm/rpm-db60.patch b/meta/recipes-devtools/rpm/rpm/rpm-db60.patch
> index b4df8b7..403f3cb 100644
> --- a/meta/recipes-devtools/rpm/rpm/rpm-db60.patch
> +++ b/meta/recipes-devtools/rpm/rpm/rpm-db60.patch
> @@ -13,11 +13,11 @@ Index: rpm/configure.ac
>   [RPM_CHECK_LIB(
>       [Berkeley-DB], [db],
>  -    [db-6.1], [db_create], [db.h],
> -+    [db-6.0], [db_create], [db.h],
> ++    [db-6.2], [db_create], [db.h],
>       [yes,external], [db6],
>       [ DBLIBSRCS="$DBLIBSRCS db3.c"
>  -      DBXY=db61
> -+      DBXY=db60
> ++      DBXY=db62
>         AM_CONDITIONAL(WITH_DB, [ true ])
>         AM_CONDITIONAL(WITH_DB_INTERNAL, [ test ".$RPM_CHECK_LIB_LOCATION" = .internal ])
>         if test ".$RPM_CHECK_LIB_LOCATION" = .internal; then
> @@ -26,7 +26,7 @@ Index: rpm/configure.ac
>   ])
>   
>  -if test ".$ac_cv_lib_db_6_1_db_create" != .yes -a ".$ac_cv_lib_db_5_3_db_create" != .yes; then
> -+if test ".$ac_cv_lib_db_6_0_db_create" != .yes -a ".$ac_cv_lib_db_5_3_db_create" != .yes; then
> ++if test ".$ac_cv_lib_db_6_2_db_create" != .yes -a ".$ac_cv_lib_db_5_3_db_create" != .yes; then
>       CPPFLAGS="${CPPFLAGS_save}"
>   fi
>   
> @@ -36,12 +36,12 @@ Index: rpm/configure.ac
>   
>  -dnl # Sqlite 3.8.3.1 from db-6.1.19
>  -if test ".$ac_cv_lib_db_6_1_db_create" = .yes; then
> -+dnl # Sqlite 3.8.3.1 from db-6.0.30
> -+if test ".$ac_cv_lib_db_6_0_db_create" = .yes; then
> ++dnl # Sqlite 3.8.3.1 from db-6.2.23
> ++if test ".$ac_cv_lib_db_6_2_db_create" = .yes; then
>   RPM_CHECK_LIB(
>       [Berkeley-DB (+SQLite3)], [dbsql],
>  -    [db_sql-6.1], [sqlite3_open], [dbsql.h],
> -+    [db_sql-6.0], [sqlite3_open], [dbsql.h],
> ++    [db_sql-6.2], [sqlite3_open], [dbsql.h],
>       [yes,external], [db6/sql],
>       [
>         AM_CONDITIONAL(WITH_DBSQL, [ true ])
> 


