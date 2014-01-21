Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id A25326157A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 13:02:35 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id cc10so4300832wib.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 05:02:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=mJrXOQcOQH9adtr0Hc+pN/NiLbytGNOVBYX6wXALEkY=;
	b=JT+S/Qns5wxnS8E9w9U9rpimsp0vhohYnLOarkN6izluwGEaTLASBQz1x/1qWK4TmF
	IgwQ5ad3G90YRQapwm42mYs0rtlEtpcHsXvN7WEAOK8jeYfjtEUWE9FoemdWrdAsV+YD
	I9DSLeWM9+S8ueZVj/Fx1ECJt28UIaErPN7qM35iDHhFiY2HauexzYWAIfpn5WAYtMJM
	epkzfWS/qaYjbu2RKjF14UnTz5zTFoSmk0gZqOnL9CElK1+Fo+qfoeQy7zU5wUVAXldi
	MdI7qVkk28fj7VGIvWoFvpUyjL/93bwvoGe2P0bdVtIg0aTAbY2EhfryocoWi/RJ5ck2
	9EQQ==
X-Gm-Message-State: ALoCoQl/Vp17L5gs7sySqJ1z1hFPrSK8UTEc/3uI5mZyF3HIiYtaHTreZm4JUOGHiMkLyGg7+Nbu
X-Received: by 10.194.20.33 with SMTP id k1mr15781019wje.40.1390309355873;
	Tue, 21 Jan 2014 05:02:35 -0800 (PST)
Received: from ?IPv6:2001:610:612:0:5e51:4fff:fec8:7c15?
	([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id hy8sm7683948wjb.2.2014.01.21.05.02.34
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 21 Jan 2014 05:02:34 -0800 (PST)
Message-ID: <52DE6FEA.5070300@linaro.org>
Date: Tue, 21 Jan 2014 14:02:34 +0100
From: Koen Kooi <koen.kooi@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1390302081-29499-1-git-send-email-koen.kooi@linaro.org>
	<20140121130110.GC4100@jama>
In-Reply-To: <20140121130110.GC4100@jama>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd 208: move stray /usr/lib/systemd/* into /lib/systemd
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
X-List-Received-Date: Tue, 21 Jan 2014 13:02:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/21/2014 02:01 PM, Martin Jansa wrote:
> On Tue, Jan 21, 2014 at 12:01:21PM +0100, Koen Kooi wrote:
>> From: Koen Kooi <koen@dominion.thruhere.net>
>>
>> Apps testing for systemd config get confused when both /usr/lib/systemd and /lib/systemd exist. This fixes (among other things) dracut systemd detections.
>>
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>>   meta/recipes-core/systemd/systemd_208.bb | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/meta/recipes-core/systemd/systemd_208.bb b/meta/recipes-core/systemd/systemd_208.bb
>> index 6590235..710624c 100644
>> --- a/meta/recipes-core/systemd/systemd_208.bb
>> +++ b/meta/recipes-core/systemd/systemd_208.bb
>> @@ -113,6 +113,12 @@ do_install() {
>>
>>           # Delete journal README, as log can be symlinked inside volatile.
>>           rm -f ${D}/${localstatedir}/log/README
>> +
>> +	# fix up libdir confusion
>> +	if [ -d ${D}${libdir}/systemd ] ; then
>> +		cp -a ${D}${libdir}/systemd/* ${D}${systemd_unitdir}
>> +		rm -rf ${D}${libdir}/systemd
>> +	fi
>
> It's not your fault, but the indentation looks inconsistent with rest of
> do_install()

And I did especially pay attention to use tabs after all the meta-oe 
patches I did :)

