Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.57])
 by mx.groups.io with SMTP id smtpd.web12.2942.1615254778603105307
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 17:52:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NFzflfh3;
 spf=pass (domain: windriver.com, ip: 40.107.244.57, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NmjHMOGMAdO9bLzvQrnlMahmNTVeVv+H/qmBbVUTULuGW0SGjWe+JWVlvOGz48oBss8TADOxS/ycu4+6LGflczQPwM5bWk8+rykX/is+G+w5rMoBiHtBxxOOiTiwv4goW+E2j4oNdEThD/uraUR3SM1ZVfsP6Qblk14JEuJIoElmqGXfYPSfv8vbo73r1CFvQ63BwJvJGy3Fp+01W9UHAsCH6n+J1JzOn3qOVnby5M6Do7rj4lXKDIefq/3/oSaWn402lgrKpo57G196AF7BLtkK613bAOhx73c8dyQiS4lvf3/GpXS1mLUYJ6s1PrCUrr02sBw7UgWTFLGcNqfCOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMbOnaCuvaZO2uChdzHB38KffQCeqcVrh96B3T6tV3A=;
 b=N/eHOq4RYDvTwyKHiIxfS5JjQ0xmJR/RqIYyrPHzwIZpcDpE7Rh79eUgM+d63+4F3lRR/F7nTxr4EIjRRNE9fb3tekjvyDc/s7pbkdWySAdosEd2s4NKRTRRb+E3G+sPhepbn92YNgWu0oDgvto0gg3J6WtvHZm+li4d1emEv7EB14Raqy8N8JfY7EtLx/YYrBz8m+SzVNRS5jvQ8uUQo8QnjHtoHL37un3oMxUtZv2oEZOh9l+cITr4AjC0cMiOt/mAGSOiGVhQaVd7BDjs+9cD3pHm9J2lmd5GafuWUvEfvHi22F+mq06Bpy2ZSmStCGEoSZca4cGKdut40pHPjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMbOnaCuvaZO2uChdzHB38KffQCeqcVrh96B3T6tV3A=;
 b=NFzflfh3S3/I0SrLoxifgiQgUZbRmlkzWXppGqqtjHIuWqQkXKrNiVSA7+fHK55V4vcfDIHeEKy+z2lhChqZDRCjzia1Wnb85IBZTYmdbl4o2mgmG4M/eOvnYKsCNQAPa7CrUjG0mLUqbJ8T8DqHaIrr+nlth1ZQs6bXUYTrvHA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB2535.namprd11.prod.outlook.com (2603:10b6:a02:be::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Tue, 9 Mar
 2021 01:52:56 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::d9b:3f7c:136d:e60]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::d9b:3f7c:136d:e60%7]) with mapi id 15.20.3890.038; Tue, 9 Mar 2021
 01:52:56 +0000
Subject: Re: [OE-core] [PATCH 1/1] extrausers: Add ability to force password change on first login
To: Mark Hatle <mark.hatle@kernel.crashing.org>,
 openembedded-core@lists.openembedded.org
References: <20210308180836.144245-1-mark.hatle@kernel.crashing.org>
 <20210308180836.144245-2-mark.hatle@kernel.crashing.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <7e9765f3-7786-fcb3-ef59-9315817213ec@windriver.com>
Date: Tue, 9 Mar 2021 10:02:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <20210308180836.144245-2-mark.hatle@kernel.crashing.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0075.apcprd04.prod.outlook.com
 (2603:1096:202:15::19) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.161] (60.247.85.82) by HK2PR04CA0075.apcprd04.prod.outlook.com (2603:1096:202:15::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.3912.17 via Frontend Transport; Tue, 9 Mar 2021 01:52:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4021bc95-f8ae-4c63-c4f5-08d8e29e0f3e
X-MS-TrafficTypeDiagnostic: BYAPR11MB2535:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2535D9EE06A1CC01143FE695ED929@BYAPR11MB2535.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mTpWn6HSVM7LIynh/2AnrUBNLV8cgCIV4FjUWjN+HaCONUnVQN0TH6MAr4FiwGBUErsDeASZDu0xsjIKkapvF9rqK/nZUZKF+L+71NDAnEOOiUWLsjzwi2b/TTZjA1ge8cDbiW6PWS6lMexXIIdJdGWbfZRilR3z68w6JIoTZukzI2qVT2ByfhYd/2O6+hmrzB1PkrCSQ8QGQ+NkHy0q58a3GCw0G9HjHxCNFUwL97o5BkE8zPcM+JbtS8/NpYY6v9fMMIfgCjJHEp8Fa+esXrKCLOPd/JSJAzDeQne5/PfZMJUcBb3VoQirD8oI1n6+r3lQsqDlvS+3vBB10zelOHzehJBN6ts/cmxyGZvGK4L7C2EC31CQ0+H4qGVvPc/1KO8RgAJX88fED7Qd8baIEoOKRdYfsrrPGzki0gZceJ+vBhwYyH49cPwKUbsqI5SfhVOWwb1HWj3ydcEfsg1KhBmY9TAbI+xqkn1T7UV8aF9+8xSSpe5RAMxIjhtjjXW9jPrL+ni+xTgbrvEvj25vc/j4JTHOu5H+IKTp+CYgTsd25OPSSDn7tgIFY8xHhYyKvb20iIh364TzSCO/6H7OClIMfW0UD03bA5QrFGl4y7G3clQ9Np/KKypT+Q9W7inEJaxzVHf7yffnGZBVzzkpsWeB/Og6oNPDLuxhCvfNviBbenPft7LS+MaG0spQZtl0MwcYMyWUyjoYO5FcXRYudg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(366004)(346002)(396003)(376002)(66476007)(966005)(6706004)(53546011)(316002)(26005)(33964004)(36756003)(186003)(478600001)(166002)(16576012)(52116002)(8676002)(2906002)(956004)(2616005)(86362001)(66556008)(8936002)(5660300002)(16526019)(31696002)(83380400001)(6486002)(31686004)(66946007)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?LzhhK05vQVl6MStGRDBnbWhBcHU3YThBcUdjWkFuN1l1NisxdHJiUjBERFdt?=
 =?utf-8?B?a0NlR01obUJ1cW9Qbk1HU2lISVBaRFJvQnZZNmcyK3BmaTlSV2psUGVnajZt?=
 =?utf-8?B?QmU2ZkpXdE1oU2JNSTZwUy9Ic2liNWw2OG5kNjcvakNocHRSdDlwSEVNMCta?=
 =?utf-8?B?blNMNXZnN0Zqajh2dGcvSjJURS9lazRtSjVkbUtkK0c2d2pOYm5ZOCtrcTRk?=
 =?utf-8?B?Q01USmFySVVOdFJjc0ZQSVZPdUdRQjRKYmhDSlpGZU1SbmVLY3RFQ3BHeUFG?=
 =?utf-8?B?azVWSWp6dGxrKy9STWIrL24zUUQ2b0N2OUlscXJ6UUN1TDBWc1lxWVhBM2Fj?=
 =?utf-8?B?QTZoNUtXYWpBb3BoaWVORGUvbStoNmd0eWN1TWJBckQ3cU0rN2U2Yk5TTEEy?=
 =?utf-8?B?K0NQRFNSU2lzUklOTC9rOFR3TExSdlUxclVrQXJkWmZheEFaUzdxdUpYNEZE?=
 =?utf-8?B?b001MzYyeHNTZXJlU0dPd0RKLzcrdW9qQk12Z2FsanpwTkIraEpvTCt4Qndn?=
 =?utf-8?B?WGRGT2dpTU9pN0dtNEhwSmNWMEhtYkpveVE0RU1xa0RONFduVXVKeEJWK1dh?=
 =?utf-8?B?eXlPb2xyMzVFYnpUanhCNUNMNElQZkwrSGJ0aWplOUdVNTZPd2RaMzZXMFY0?=
 =?utf-8?B?R2RaOHNaQzBnY2QvQVF3TG9qU3V2TElIUzBjRkgyQ0pIMTdVWUg0L2xQaXo2?=
 =?utf-8?B?NUpOMnZGUTNENE5BWmJsK0x3VUUzU01NbkRsK1R5d2hzaVdNZ3pXUVErK3Vm?=
 =?utf-8?B?d3oxZ2JHWVFRTDJjcHp6RE5vSkhwZmE4SHRQeExxSVloY2V0ZUlpZkg2QkpM?=
 =?utf-8?B?dTYrRXNLOEY3MTZTallrL1RPWHVQUWJHZTNZN1dsaUZ1ZGNUMEJqdTNsUWNq?=
 =?utf-8?B?TTQya1pxRGlzcnZTUHMrOUxJVVcrSHJiNFBvY2xhenZYaVllZThpSTNPOHp5?=
 =?utf-8?B?Mk9yWnhXNVVraVBNK285OWVOYjR3TzladUo1US8xZUFGVlZRMGNkWEZreS90?=
 =?utf-8?B?QVRvbFRNb0pUYWdDdFJzOW9kS1JQQ0ZrMU1QZFo3bkJKUXB4QldDVitKOVox?=
 =?utf-8?B?SWo5am9ENXl1NVQ3SktaQ2JrRjErc01hRE1Nd3FNY1FXTlZqZnFlTHNSeTY3?=
 =?utf-8?B?Z0sreHdvMWhCVFJCN0o4aDRnb3VUKzNxK3YvMS9lNWRzTVFuMkx1QTNKYXdp?=
 =?utf-8?B?eGVMUGswcXVFSU5nUm9GREJ0Z215RDBuL3VQSWxyT0RNLzE5MWlsK0lXK0pr?=
 =?utf-8?B?OWEwWDZ4NGQwU0VWZ3A2OUlqNHJEcTRLMDZtYVBMd1RNL0VWbkdnTWpMa0ZC?=
 =?utf-8?B?NENDRmFzMTdjb1FmNnNnMXUwd08wTDl2NWw3WnpsY2VzblJ0WExvak5pNHVR?=
 =?utf-8?B?SXRSMjdrMVgxWW9BVTlmais5ODRETVE4bXpURkdsekowUEFzVFJOdUVtOEta?=
 =?utf-8?B?Tm1TaXgrRHNUenZMY1hJTWk0VDZxajh4Y2JmTzh6M0oycElHVWRLK216RnpP?=
 =?utf-8?B?NGNLMkJ3dDJnN2o2TlVWcENqTEVEN2NqcnNsL0diaktVMlBPSG1hUzd4blFO?=
 =?utf-8?B?NXpURjJQZ2kwL2NiTDJxc2tGQWw2YUpGUGV2eUJWSTJLZFFOZGZPQS9YWmx3?=
 =?utf-8?B?S1lTWEY0Tm9YajlpUG5LNVU3SWlkQWNJY0tDbzhzWkFlVlkzb1lYUGlQSlND?=
 =?utf-8?B?bDQ2THN5YXB4ZWRaQWpuckd3ODdRUWk2RThYTkxtRFdreHlmUW4xdmpuTzFr?=
 =?utf-8?Q?Y72IudCmCd+EX7rAx7z7FQsJl+RUh/RdRA7HLTt?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4021bc95-f8ae-4c63-c4f5-08d8e29e0f3e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 01:52:56.4445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HDv2baqlSO4aIWk4a30BsRPLPykgRY/Sj3qZqt7HIZK0kYAOAQhuJNMWzrIDQgMICCzYSzct4GJy4pRQukq2pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2535
Content-Type: multipart/alternative;
 boundary="------------F281F0F84B8265230B355B23"

--------------F281F0F84B8265230B355B23
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mark,

Is it something similar to 'passwd-expire' in this extrausers.bbclass?

Best Regards,
Chen Qi

On 03/09/2021 02:08 AM, Mark Hatle wrote:
> As documented in shadow(5), the third parameter is the last login time.  A
> special value of '0' is defined which causes the password system to force
> a password change on next login.
>
> Adding the variable "EXTRA_FORCE_PASSWORD_CHANGE", a space separated list of
> user names, we can use this to adjust the shadow file's third value for the
> listed users.
>
> Note: This does have the same dependencies as other usages of extrausers,
> specifically base-passwd and shadow.
>
> Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> ---
>   meta/classes/extrausers.bbclass | 29 +++++++++++++++++++++++++++--
>   meta/conf/documentation.conf    |  1 +
>   2 files changed, 28 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/extrausers.bbclass b/meta/classes/extrausers.bbclass
> index 90811bfe2a..e9d9358bef 100644
> --- a/meta/classes/extrausers.bbclass
> +++ b/meta/classes/extrausers.bbclass
> @@ -14,10 +14,10 @@
>   
>   inherit useradd_base
>   
> -PACKAGE_INSTALL_append = " ${@['', 'base-passwd shadow'][bool(d.getVar('EXTRA_USERS_PARAMS'))]}"
> +PACKAGE_INSTALL_append = " ${@['', 'base-passwd shadow'][bool(d.getVar('EXTRA_USERS_PARAMS')) or bool(d.getVar('EXTRA_FORCE_PASSWORD_CHANGE'))]}"
>   
>   # Image level user / group settings
> -ROOTFS_POSTPROCESS_COMMAND_append = " set_user_group;"
> +ROOTFS_POSTPROCESS_COMMAND_append = "${@['', ' set_user_group;'][bool(d.getVar('EXTRA_USERS_PARAMS'))]}"
>   
>   # Image level user / group settings
>   set_user_group () {
> @@ -66,6 +66,31 @@ set_user_group () {
>   	done
>   }
>   
> +# Image level force a specific user/users to reset their password on first login
> +# Note: this requires shadow passwords and login programs that respect the shadow
> +# expiration field.
> +ROOTFS_POSTPROCESS_COMMAND_append = "${@['', ' force_password_change;'][bool(d.getVar('EXTRA_FORCE_PASSWORD_CHANGE'))]}"
> +
> +# Works by setting 'date of last password change' to 0, which has a special
> +# meaning of 'user should change her password the next time she will log in the
> +# system' See: shadow (5)
> +force_password_change () {
> +	if [ ! -e ${IMAGE_ROOTFS}/etc/shadow ]; then
> +		bberror "/etc/shadow does not exist in the image, unable to set password change on login."
> +		return
> +	fi
> +	passwd_change_users="${EXTRA_FORCE_PASSWORD_CHANGE}"
> +	export PSEUDO="${FAKEROOTENV} ${STAGING_DIR_NATIVE}${bindir}/pseudo"
> +	for name in $passwd_change_users; do
> +		if ! grep -q '^'$name':' ${IMAGE_ROOTFS}/etc/shadow ; then
> +			bberror "Unable to find user $name in /etc/shadow, unable to set password change on login."
> +		fi
> +		bbnote "Set user $name to need a password change on first login."
> +		cmd="sed -i ${IMAGE_ROOTFS}/etc/shadow -e 's,^'$name':\\([^:]*\\):[^:]*:,'$name':\\1:0:,'"
> +		eval flock -x ${IMAGE_ROOTFS}${sysconfdir} -c \"$PSEUDO $cmd\" || true
> +	done
> +}
> +
>   USERADDEXTENSION ?= ""
>   
>   inherit ${USERADDEXTENSION}
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index c5a38b0764..d1c5b8b1a3 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -169,6 +169,7 @@ EXTRA_OESCONS[doc] = "When a recipe inherits the scons class, this variable spec
>   EXTRA_QMAKEVARS_POST[doc] = "Configuration variables or options you want to pass to qmake when the arguments need to be after the .pro file list on the command line."
>   EXTRA_QMAKEVARS_PRE[doc] = "Configuration variables or options you want to pass to qmake when the arguments need to be before the .pro file list on the command line."
>   EXTRA_USERS_PARAMS[doc] = "When a recipe inherits the extrausers class, this variable provides image level user and group operations."
> +EXTRA_FORCE_PASSWORD_CHANGE[doc] = "When a recipe inherits the extrausers class, this variable causes the specified users to require a password change on first login."
>   
>   #F
>   
>
>
> 
>


--------------F281F0F84B8265230B355B23
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Hi Mark,<br>
      <br>
      Is it something similar to 'passwd-expire' in this
      extrausers.bbclass?<br>
      <br>
      Best Regards,<br>
      Chen Qi<br>
      <br>
      On 03/09/2021 02:08 AM, Mark Hatle wrote:<br>
    </div>
    <blockquote cite="mid:20210308180836.144245-2-mark.hatle@kernel.crashing.org" type="cite">
      <pre wrap="">As documented in shadow(5), the third parameter is the last login time.  A
special value of '0' is defined which causes the password system to force
a password change on next login.

Adding the variable &quot;EXTRA_FORCE_PASSWORD_CHANGE&quot;, a space separated list of
user names, we can use this to adjust the shadow file's third value for the
listed users.

Note: This does have the same dependencies as other usages of extrausers,
specifically base-passwd and shadow.

Signed-off-by: Mark Hatle <a class="moz-txt-link-rfc2396E" href="mailto:mark.hatle@xilinx.com">&lt;mark.hatle@xilinx.com&gt;</a>
Signed-off-by: Mark Hatle <a class="moz-txt-link-rfc2396E" href="mailto:mark.hatle@kernel.crashing.org">&lt;mark.hatle@kernel.crashing.org&gt;</a>
---
 meta/classes/extrausers.bbclass | 29 +++++++++++++++++++++++++++--
 meta/conf/documentation.conf    |  1 +
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/meta/classes/extrausers.bbclass b/meta/classes/extrausers.bbclass
index 90811bfe2a..e9d9358bef 100644
--- a/meta/classes/extrausers.bbclass
+++ b/meta/classes/extrausers.bbclass
@@ -14,10 +14,10 @@
 
 inherit useradd_base
 
-PACKAGE_INSTALL_append = &quot; ${@['', 'base-passwd shadow'][bool(d.getVar('EXTRA_USERS_PARAMS'))]}&quot;
+PACKAGE_INSTALL_append = &quot; ${@['', 'base-passwd shadow'][bool(d.getVar('EXTRA_USERS_PARAMS')) or bool(d.getVar('EXTRA_FORCE_PASSWORD_CHANGE'))]}&quot;
 
 # Image level user / group settings
-ROOTFS_POSTPROCESS_COMMAND_append = &quot; set_user_group;&quot;
+ROOTFS_POSTPROCESS_COMMAND_append = <a class="moz-txt-link-rfc2396E" href="mailto:${@['','set_user_group;'][bool(d.getVar('EXTRA_USERS_PARAMS'))]}">&quot;${@['', ' set_user_group;'][bool(d.getVar('EXTRA_USERS_PARAMS'))]}&quot;</a>
 
 # Image level user / group settings
 set_user_group () {
@@ -66,6 +66,31 @@ set_user_group () {
 	done
 }
 
+# Image level force a specific user/users to reset their password on first login
+# Note: this requires shadow passwords and login programs that respect the shadow
+# expiration field.
+ROOTFS_POSTPROCESS_COMMAND_append = <a class="moz-txt-link-rfc2396E" href="mailto:${@['','force_password_change;'][bool(d.getVar('EXTRA_FORCE_PASSWORD_CHANGE'))]}">&quot;${@['', ' force_password_change;'][bool(d.getVar('EXTRA_FORCE_PASSWORD_CHANGE'))]}&quot;</a>
+
+# Works by setting 'date of last password change' to 0, which has a special
+# meaning of 'user should change her password the next time she will log in the
+# system' See: shadow (5)
+force_password_change () {
+	if [ ! -e ${IMAGE_ROOTFS}/etc/shadow ]; then
+		bberror &quot;/etc/shadow does not exist in the image, unable to set password change on login.&quot;
+		return
+	fi
+	passwd_change_users=&quot;${EXTRA_FORCE_PASSWORD_CHANGE}&quot;
+	export PSEUDO=&quot;${FAKEROOTENV} ${STAGING_DIR_NATIVE}${bindir}/pseudo&quot;
+	for name in $passwd_change_users; do
+		if ! grep -q '^'$name':' ${IMAGE_ROOTFS}/etc/shadow ; then
+			bberror &quot;Unable to find user $name in /etc/shadow, unable to set password change on login.&quot;
+		fi
+		bbnote &quot;Set user $name to need a password change on first login.&quot;
+		cmd=&quot;sed -i ${IMAGE_ROOTFS}/etc/shadow -e 's,^'$name':\\([^:]*\\):[^:]*:,'$name':\\1:0:,'&quot;
+		eval flock -x ${IMAGE_ROOTFS}${sysconfdir} -c \&quot;$PSEUDO $cmd\&quot; || true
+	done
+}
+
 USERADDEXTENSION ?= &quot;&quot;
 
 inherit ${USERADDEXTENSION}
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index c5a38b0764..d1c5b8b1a3 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -169,6 +169,7 @@ EXTRA_OESCONS[doc] = &quot;When a recipe inherits the scons class, this variable spec
 EXTRA_QMAKEVARS_POST[doc] = &quot;Configuration variables or options you want to pass to qmake when the arguments need to be after the .pro file list on the command line.&quot;
 EXTRA_QMAKEVARS_PRE[doc] = &quot;Configuration variables or options you want to pass to qmake when the arguments need to be before the .pro file list on the command line.&quot;
 EXTRA_USERS_PARAMS[doc] = &quot;When a recipe inherits the extrausers class, this variable provides image level user and group operations.&quot;
+EXTRA_FORCE_PASSWORD_CHANGE[doc] = &quot;When a recipe inherits the extrausers class, this variable causes the specified users to require a password change on first login.&quot;
 
 #F
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">


</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------F281F0F84B8265230B355B23--
