Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EA54A77818
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 16:26:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2EGQDE0008451
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 14 Mar 2017 09:26:14 -0700
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 14 Mar 2017 09:26:13 -0700
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	<openembedded-core@lists.openembedded.org>
References: <20170314155619.7506-1-pkj@axis.com>
	<20170314155619.7506-2-pkj@axis.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <0ca1fa9c-359c-7715-f3f4-b420afa082aa@windriver.com>
Date: Tue, 14 Mar 2017 11:26:12 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170314155619.7506-2-pkj@axis.com>
Subject: Re: [PATCHv2 2/2] useradd-staticids.bbclass: Always fail/warn for missing IDs
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
X-List-Received-Date: Tue, 14 Mar 2017 16:26:18 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 3/14/17 10:56 AM, Peter Kjellerstedt wrote:
> Previously, with USERADD_ERROR_DYNAMIC set to error/warn, if a static
> UID/GID was specified in the recipe, then no error/warning would be
> issued even if no ID was specified in the passwd/groups files.

I'm glad it was this simple to implement.

Acked.

--Mark

> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/classes/useradd-staticids.bbclass | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
> index 9b194df490..c156a12ee5 100644
> --- a/meta/classes/useradd-staticids.bbclass
> +++ b/meta/classes/useradd-staticids.bbclass
> @@ -123,8 +123,7 @@ def update_useradd_static_config(d):
>                  users = merge_files(get_passwd_list(d), 7)
>  
>              if uaargs.LOGIN not in users:
> -                if not uaargs.uid or not uaargs.uid.isdigit() or not uaargs.gid:
> -                    handle_missing_id(uaargs.LOGIN, 'user', pkg)
> +                handle_missing_id(uaargs.LOGIN, 'user', pkg)
>                  newparams.append(param)
>                  continue
>  
> @@ -259,8 +258,7 @@ def update_useradd_static_config(d):
>                  groups = merge_files(get_group_list(d), 4)
>  
>              if gaargs.GROUP not in groups:
> -                if not gaargs.gid or not gaargs.gid.isdigit():
> -                    handle_missing_id(gaargs.GROUP, 'group', pkg)
> +                handle_missing_id(gaargs.GROUP, 'group', pkg)
>                  newparams.append(param)
>                  continue
>  
> 


