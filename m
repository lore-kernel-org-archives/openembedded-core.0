Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DF8C190103
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 09:22:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x8I9MYVj016586
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 02:22:35 -0700 (PDT)
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Wed, 18 Sep 2019 02:22:34 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1568770285-205402-1-git-send-email-changqing.li@windriver.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <0af8e9b6-2384-cff1-1d7f-8081aca92e9d@windriver.com>
Date: Wed, 18 Sep 2019 17:22:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1568770285-205402-1-git-send-email-changqing.li@windriver.com>
X-Originating-IP: [128.224.162.186]
Subject: Re: [PATCH V2] report-error.bbclass: add local.conf/auto.conf into error report
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
X-List-Received-Date: Wed, 18 Sep 2019 09:22:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

It is ok to merge this repo first, and error-report-web still old,  
since error-report-web will ignore the new field.

but cannot update error-report-web to new one first,  or the database of 
error-report-web will report error

since report from oe-core don't provide default value for the new field 
of database.

On 9/18/19 9:31 AM, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> sometimes, it is not enough to reproduce a failed build with current
> info on error reports web, add local.conf/auto.conf into error
> report to make it more easier to reproduce failed build
>
> Note: this need work together with change in repo error-report-web,
> which will display local.conf and auto.conf as Error Details
>
> [YOCTO #13252]
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   meta/classes/report-error.bbclass | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>
> diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
> index 1c55abf..ea043b2 100644
> --- a/meta/classes/report-error.bbclass
> +++ b/meta/classes/report-error.bbclass
> @@ -25,6 +25,19 @@ def errorreport_savedata(e, newdata, file):
>           json.dump(newdata, f, indent=4, sort_keys=True)
>       return datafile
>   
> +def get_conf_data(e, filename):
> +    builddir = e.data.getVar('TOPDIR')
> +    filepath = os.path.join(builddir, "conf", filename)
> +    jsonstring = ""
> +    if os.path.exists(filepath):
> +        with open(filepath, 'r') as f:
> +            for line in f.readlines():
> +                if line.startswith("#") or len(line.strip()) == 0:
> +                    continue
> +                else:
> +                    jsonstring=jsonstring + line
> +    return jsonstring
> +
>   python errorreport_handler () {
>           import json
>           import codecs
> @@ -51,6 +64,8 @@ python errorreport_handler () {
>               data['failures'] = []
>               data['component'] = " ".join(e.getPkgs())
>               data['branch_commit'] = str(base_detect_branch(e.data)) + ": " + str(base_detect_revision(e.data))
> +            data['local_conf'] = get_conf_data(e, 'local.conf')
> +            data['auto_conf'] = get_conf_data(e, 'auto.conf')
>               lock = bb.utils.lockfile(datafile + '.lock')
>               errorreport_savedata(e, data, "error-report.txt")
>               bb.utils.unlockfile(lock)

-- 
BRs

Sandy(Li Changqing)


