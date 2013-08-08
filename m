Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3F45361013
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 02:16:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r782Gj2e007576
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 7 Aug 2013 19:16:45 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Wed, 7 Aug 2013 19:16:45 -0700
Message-ID: <5202FFA2.8030308@windriver.com>
Date: Thu, 8 Aug 2013 10:17:06 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1375862591.git.Qi.Chen@windriver.com>
	<9a4e60262e656b8e3138805c74b8f5ed3bf40fbe.1375862591.git.Qi.Chen@windriver.com>
	<CAP9ODKpyS3L0H6HpRwouVmesHXr8Yk3AW48s2_xCZhkKMF8iJQ@mail.gmail.com>
In-Reply-To: <CAP9ODKpyS3L0H6HpRwouVmesHXr8Yk3AW48s2_xCZhkKMF8iJQ@mail.gmail.com>
X-Originating-IP: [128.224.162.233]
Cc: Christopher Larson <clarson@kergoth.com>, chen_q07@163.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V4 02/10] use a uniform way to determine whether rootfs is read-only
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
X-List-Received-Date: Thu, 08 Aug 2013 02:16:50 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2013 04:29 AM, Otavio Salvador wrote:
> On Wed, Aug 7, 2013 at 5:08 AM,  <Qi.Chen@windriver.com> wrote:
> ...
>> --- a/meta/recipes-core/initscripts/initscripts-1.0/functions
>> +++ b/meta/recipes-core/initscripts/initscripts-1.0/functions
>> @@ -58,3 +58,17 @@ status() {
>>       fi
>>       return 3
>>   }
>> +
>> +# Determine whether rootfs is read-only or not according to /proc/mounts or /etc/fstab.
>> +is_rootfs_readonly () {
>> +    local DIRNAME=`dirname $0`
>> +    local ROOT_DIR=`echo $DIRNAME | sed -ne 's:/etc/.*::p'`
>> +    local criteria_file
>> +    [ -n "$ROOT_DIR" ] && criteria_file="$ROOT_DIR/etc/fstab" || criteria_file="/proc/mounts"
>> +    local flag
>> +    for flag in `awk '{ if ($2 == "/") { split($4,FLAGS,",") } }; END { for (f in FLAGS) print FLAGS[f] }' < $criteria_file`; do
>> +       [ "$flag" = "ro" ] && { echo "yes"; return 0; }
>> +    done
>> +    echo "no"
>> +    return 0
>> +}
>> \ No newline at end of file
> Please fix this.
>
Thanks for pointing it out.

Remote branch has been updated :)

Best Regards,
Chen Qi

