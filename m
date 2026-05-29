Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D310CD6E4A
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 13:08:58 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9263.1780058059615045174
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2026 05:34:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=n1/oSNhF;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=ZJYh3zga;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: mengshi.wu@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TBxUi1562432
	for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 12:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gVdQJsM5iG6ezC6URslcFhMbZl9ZBhMsDVMXHZ42jzg=; b=n1/oSNhFE8EXgRiT
	xnbAOqkOV0Ae+0GEegqfVaAZrFY8uaJM5v6AAvTiO0Xd/9dZbu4m9PhR2X3kUGgy
	2yePFNA3RHkCPmCCXgommDs8idqE3WABR+RGXuuhJAhlbWwnFY84VmDm1e6iWNvX
	Fp7jW4iiFdJTLQ7mc5s5YlfoTzm5hjClnpDToGa5XUjGgzZRvdG7487YWjytXyYk
	PmQ6Lws+QS2w12RCNgpds5B4yxlIiN1mq5rb3JQakr4BqILEvS6Fc6xs/9lNrncJ
	RQ2Nk0BNoPjzOjltGdEwKt1uw5Tx0fX3xgIqT/2y7XIR3fTiRsJAUPIKlPjmLefl
	OWltwQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevug3hxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 12:34:18 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304d8e9563eso1802048eec.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 05:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780058058; x=1780662858; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gVdQJsM5iG6ezC6URslcFhMbZl9ZBhMsDVMXHZ42jzg=;
        b=ZJYh3zga4tW0h4/Tvq4/Zp60mFNT59Smrlix5xM2Jlr5Gi6JNG23p3DqwzNB9z7GwF
         IEoAa916xt5zy3Jvph+fCIEBp4BRo2Nq5Mim4oK95+oQ85el1gusWp1PoOyb8Hniuscp
         MF1rPrYfo83FAqgCDZ2BGqtkCgluNERWeyysziLAj++sw5FZwPeqv8S0HbSPdmPBwPtn
         jhgYmxYmuEmVnQeeXaOGmx5vEfcD+I+TModo8WMx8eub2teL3yEAvfa5YwFs0TB4cxIu
         onXypaF9pMIHH0e0ZAT9Ot+y37BvS9NnEVeLO40P7zzHidUsmO6Ez5iXVTkLtXvxwWcV
         8WOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780058058; x=1780662858;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gVdQJsM5iG6ezC6URslcFhMbZl9ZBhMsDVMXHZ42jzg=;
        b=a6ygZ+zfygAPmzVkW4pXJYIXjuvN0a/Mzcc6XTEQmGuq8ej9T1vw1Nl3sA1YV7gnyn
         asEZGuSrRcTBbOwlsytXfypl0JdemG6mUWS3ELxfS+bWnUr0YiSYBu0J5fvTb0Z/Nz6H
         32PV1UcQx6Q+OSuw7pHymqE7YHmNwuisemt0jfiWnJRSiaMcY85s9szGGGSCepRlvwgA
         SKjj0YGEh//q0GkgiMDQ5xI6qfKdeYoN4yiDpZjt8rvBlp2+Mn7fJNPUbkJpqDrhouWI
         Nq21tMpR1oDYNZDAM6dw/vS6K2mNvnwRwAachI5clifROf4LWSgO7RTy7eEUOaQOQkyh
         lkTA==
X-Forwarded-Encrypted: i=1; AFNElJ/XpBECD6Az5Yc2jzy6u3S+U1I3Kjsueq5trOAKNI5FHcQoMLQ+mv2PNROl1JBYejzgcIQbb641ZLhaP6dwCh80Bw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwooDZiGyCO8NvscV5gbdzUAGO2bsI/x9yxfW/Q9wRqb2TcKc/4
	abG5CLPGjN1CPbVY0Vs574HHBwdCJo+S8V0ydBLZSSE/dZmTnRTRGqzd/oG+4xBbb5U3rtfdE5Y
	UlmAPmtc23VCNI6vBPz4v8aAhCveFKy2qk4hxVbd2Dw+V6p+OGt7a8eI5OdShGtq7Wc8izmKlcS
	bDO9ORIZc=
X-Gm-Gg: Acq92OEFPtBCfGZ1F6Ow2EkA4jhogVRjqSUj9yxC/y0B1dlyVNc9cVqNI/6Mf3cv3C3
	2o603V1UBMDN/HtLAlmpdSdbAK+uzOqFSgvr0lHVQBszlZWBa96wzof0cesPZLz6beXoL0KMF8Z
	728HeSt3S2cIuFxPsj+GpcIIt1T/ee2LR++he19BM8D762WDD9OjMWTYQNqvmU27ZUk6J+7Qo3N
	VyrSsEagDcDdZBXBebmepOgZ8VR8hP8wYGt19C9XjxbX8lBFi3Rek0i60rvO01doDAfr6VKM/g3
	fmPlduuJ4GQHOBkFfZ+nFOo1bjX5IROOBI2es/IiUlqFCIqxo2OodZuvWSTHzJ2VV8Mkee2mMXo
	XF3wFiGz8AyEAQw9BXe0xrnp3s9FxuA83Ptt8PcvhJyEdUFvvC1iJYQQUeTA2aZ7rN0K7fFQ42l
	/k9S0bymg8+g==
X-Received: by 2002:a05:7300:2154:b0:2d9:6373:ad22 with SMTP id 5a478bee46e88-304eb13a8ecmr1252640eec.12.1780058057950;
        Fri, 29 May 2026 05:34:17 -0700 (PDT)
X-Received: by 2002:a05:7300:2154:b0:2d9:6373:ad22 with SMTP id 5a478bee46e88-304eb13a8ecmr1252625eec.12.1780058057401;
        Fri, 29 May 2026 05:34:17 -0700 (PDT)
Received: from [10.110.63.66] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed5d5385sm1287466eec.28.2026.05.29.05.34.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 05:34:16 -0700 (PDT)
Message-ID: <5cf7128c-1c12-4cd8-8405-d99b8bfa5de2@oss.qualcomm.com>
Date: Fri, 29 May 2026 20:34:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] bluez5: add patch to fix 8.56 gatt cache issue
From: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
Cc: shuai.zhang@oss.qualcomm.com, cheng.jiang@oss.qualcomm.com,
        chezhou@qti.qualcomm.com, wei.deng@oss.qualcomm.com,
        yiboz@qti.qualcomm.com, jinwang.li@oss.qualcomm.com
References: <20260521062216.3352030-1-mengshi.wu@oss.qualcomm.com>
 <20f1b74e-69df-4f4e-8adc-bafcae25dfbf@oss.qualcomm.com>
 <DIUYUL35MIBC.28DFKH9L53KYC@bootlin.com>
 <66751e5d-1d57-40d6-b1c9-15689f657b06@oss.qualcomm.com>
In-Reply-To: <66751e5d-1d57-40d6-b1c9-15689f657b06@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEyNSBTYWx0ZWRfX8eWWd/QRbzG/
 K/Mj186iveBIRYyrePPFN8+nWykq0Vj9YZkq+mMdlOzqzK9auWfUBMnWn3x1AL0/gZ1iuu6l8JX
 Uk67asqXx6KCuMp2+wM0o9ePD5WfWbxLU2MYwVd4p/XRtOww4O5KpMD1OivWuO5XA+S1cohRRrA
 /NRxoT9TYZizYkiN04n09sjL213BuSFVDLGCpJIylMa8dv48Ai1glQB0pPZeEfk7/+4G8P8OqVk
 JNHu0jUxgPxw2BwKNJAdlQgPW3+U4AXibIrOeh7RkXaKgNixyKIgJD7amwtvFfHmBKpONoe5kLK
 5+l+lz/UvXhRstcTUZbJKMgRhyIjeLsArIIzG0yBTt07HLUxO0UGmJydUKjo9N69WqdqTkKqvq7
 WPuSd/VM/DI2jp1mZnJ/Pwm654pbXuMyvypHH2p42GluUBlVQWVYpHF4D4OBhL8jeJiJxUwwNzW
 w6Bx1enP2OPTIx8YVLg==
X-Authority-Analysis: v=2.4 cv=SNBykuvH c=1 sm=1 tr=0 ts=6a1987ca cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=Q4-j1AaZAAAA:8 a=hUhCjytudtisZH4zFMgA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=bBxd6f-gb0O0v-kibOvt:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: DPM4RSqV6R9jtQnHJUaC-e5SiFNnJB-W
X-Proofpoint-GUID: DPM4RSqV6R9jtQnHJUaC-e5SiFNnJB-W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290125
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 13:08:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237754

Hi,

It seems that all the patches I sent are blocked by the upstream email server.

----- The following addresses had permanent fatal errors ----- <openembedded-core@lists.openembedded.org>
(reason: 500 This message has been flagged as spam.)

Best regards,
Mengshi Wu

On 5/29/2026 6:07 PM, Mengshi Wu wrote:
> Hi,
> 
> Thanks for kindly reminder. I have resent it.
> 
> Best regards,
> Mengshi Wu
> 
> On 5/29/2026 3:01 PM, Mathieu Dubois-Briand wrote:
>> On Fri May 29, 2026 at 6:06 AM CEST, Mengshi Wu via lists.openembedded.org wrote:
>>> Dear maintainers,
>>>
>>> Please help review this patch. Sorry for bothering. Thanks
>>>
>>> On 5/21/2026 2:22 PM, Mengshi Wu wrote:
>>
>> Hi,
>>
>> This mail is not in my inbox, and it looks like it never reached the
>> mailing-list:
>> https://lore.kernel.org/openembedded-core/?q=bluez5%3A+add+patch+to+fix+8.56+gatt+cache+issue
>>
>> Can you try to send it again?
>>
>> Thanks,
>> Mathieu
>>
> 


