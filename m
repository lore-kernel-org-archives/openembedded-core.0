Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A1441776BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 13:56:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2DDu0JU026974
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Mar 2017 06:56:00 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 13 Mar 2017 06:56:00 -0700
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	<openembedded-core@lists.openembedded.org>
References: <20170311052758.19671-1-pkj@axis.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <6a4f5fdd-18ea-4851-b2ec-4e889d7c012f@windriver.com>
Date: Mon, 13 Mar 2017 08:55:59 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170311052758.19671-1-pkj@axis.com>
Subject: Re: [PATCH] useradd-staticids.bbclass: Support recipes specifying static IDs
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
X-List-Received-Date: Mon, 13 Mar 2017 13:56:06 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 3/10/17 11:27 PM, Peter Kjellerstedt wrote:
> If this bblcass is used and a recipe specifies a static ID for a
> user/group as part of the USERADD_PARAM_${PN} or GROUPADD_PARAM_${PN},
> the build would fail with and error like this if there was no
> corresponding ID in the passwd/group files specified via
> USERADD_UID_TABLES/USERADD_GID_TABLES:

If the system is set in warning mode, it should warn if this is done (but allow it).

If the system is set to error mode, it should error.

The useradd-staticids class is expecting the files (tables) to contain all of
the entries.  This is specifically to avoid the situation where a new recipe is
introduced that adds a new user or group (dynamic or static -- static because it
could conflict with one of your existing static entries.)

I agree the error message below looks wrong, do the existing warning/error
messages about it not being defined int he useradd tables still occur with this
patch?

--Mark

>   ERROR: meta-oe/recipes-support/postgresql/postgresql_9.4.11.bb:
>   meta-oe/recipes-support/postgresql/postgresql_9.4.11.bb inherits
>   useradd but doesn't set USERADD_PARAM, GROUPADD_PARAM or
>   GROUPMEMS_PARAM for package postgresql
> 
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/classes/useradd-staticids.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
> index a65c3f69cb..9b194df490 100644
> --- a/meta/classes/useradd-staticids.bbclass
> +++ b/meta/classes/useradd-staticids.bbclass
> @@ -125,6 +125,7 @@ def update_useradd_static_config(d):
>              if uaargs.LOGIN not in users:
>                  if not uaargs.uid or not uaargs.uid.isdigit() or not uaargs.gid:
>                      handle_missing_id(uaargs.LOGIN, 'user', pkg)
> +                newparams.append(param)
>                  continue
>  
>              field = users[uaargs.LOGIN]
> @@ -260,6 +261,7 @@ def update_useradd_static_config(d):
>              if gaargs.GROUP not in groups:
>                  if not gaargs.gid or not gaargs.gid.isdigit():
>                      handle_missing_id(gaargs.GROUP, 'group', pkg)
> +                newparams.append(param)
>                  continue
>  
>              field = groups[gaargs.GROUP]
> 


